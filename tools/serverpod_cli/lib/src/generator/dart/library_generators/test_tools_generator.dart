import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as p;
import 'package:serverpod_cli/analyzer.dart';
import 'package:serverpod_cli/src/analyzer/dart/definitions.dart';
import 'package:serverpod_cli/src/generator/shared.dart';

class TestToolsGenerator {
  final ProtocolDefinition protocolDefinition;
  final GeneratorConfig config;

  TestToolsGenerator({
    required this.protocolDefinition,
    required this.config,
  });

  Library generateTestHelper() {
    var library = LibraryBuilder();

    _addPackageDirectives(library);

    library.body.addAll(
      [
        _buildWithServerpodFunction(),
        _buildTestEndpointsClass(),
      ],
    );

    for (var endpoint in protocolDefinition.endpoints) {
      library.body.add(_buildEndpointClassWithMethodCalls(endpoint));
    }

    return library.build();
  }

  Class _buildEndpointClassWithMethodCalls(EndpointDefinition endpoint) {
    // Unused fields result in analyzer warnings in generated code
    bool classNeedsFields = endpoint.methods.isNotEmpty;
    List<Field> classFields = classNeedsFields
        ? [
            Field(
              (fieldBuilder) {
                fieldBuilder
                  ..name = '_endpointDispatch'
                  ..modifier = FieldModifier.final$
                  ..type = refer('EndpointDispatch', serverpodUrl(true));
              },
            ),
            Field((fieldBuilder) {
              fieldBuilder
                ..name = '_serializationManager'
                ..modifier = FieldModifier.final$
                ..type = refer('SerializationManager', serverpodUrl(true));
            })
          ]
        : [];

    return Class((classBuilder) {
      classBuilder
        ..name = endpoint.className
        ..fields.addAll(classFields)
        ..constructors.add(
          Constructor(
            (constructorBuilder) {
              constructorBuilder.requiredParameters.addAll(
                [
                  Parameter(
                    (p) => p
                      ..name = '_endpointDispatch'
                      ..toThis = classNeedsFields,
                  ),
                  Parameter(
                    (p) => p
                      ..name = '_serializationManager'
                      ..toThis = classNeedsFields,
                  ),
                ],
              );
            },
          ),
        );

      classBuilder.methods.addAll(
        [
          for (var method in endpoint.methods)
            _buildEndpointMethod(method, endpoint)
        ],
      );
    });
  }

  Method _buildEndpointMethod(
      MethodDefinition method, EndpointDefinition endpoint) {
    return Method(
      (methodBuilder) {
        bool returnsStream = method.returnType.isStreamType;
        bool hasStreamParameter =
            method.parameters.any((p) => p.type.isStreamType);

        methodBuilder
          ..name = method.name
          ..returns = method.returnType.reference(true, config: config)
          ..modifier = returnsStream ? null : MethodModifier.async
          ..requiredParameters.addAll(
            [
              Parameter(
                (p) => p
                  ..name = 'session'
                  ..type = refer('TestSession', serverpodTestUrl),
              ),
              for (var parameter in method.parameters)
                Parameter(
                  (p) => p
                    ..name = parameter.name
                    ..type = parameter.type.reference(false, config: config),
                ),
            ],
          );

        methodBuilder.body = returnsStream || hasStreamParameter
            ? _buildEndpointStreamMethodCall(endpoint, method,
                hasStreamParameter: hasStreamParameter,
                returnsStream: returnsStream)
            : _buildEndpointMethodCall(endpoint, method);
      },
    );
  }

  Code _buildEndpointMethodCall(
      EndpointDefinition endpoint, MethodDefinition method) {
    var closure = Method(
      (methodBuilder) => methodBuilder
        ..modifier = MethodModifier.async
        ..body = Block.of([
          refer('var callContext')
              .assign(refer('_endpointDispatch')
                  .awaited
                  .property('getMethodCallContext')
                  .call([], {
                'createSessionCallback': Method((methodBuilder) => methodBuilder
                  ..requiredParameters.add(
                    Parameter((p) => p..name = '_'),
                  )
                  ..body = refer('session')
                      .asA(refer('InternalTestSession', serverpodTestUrl))
                      .property('serverpodSession')
                      .code).closure,
                'endpointPath': literalString(endpoint.name),
                'methodName': literalString(method.name),
                'parameters': literalMap({
                  for (var parameter in method.parameters)
                    literalString(parameter.name): refer(parameter.name).code,
                }),
                'serializationManager': refer('_serializationManager'),
              }))
              .statement,
          refer('callContext')
              .property('method')
              .property('call')
              .call([
                refer('session')
                    .asA(refer('InternalTestSession', serverpodTestUrl))
                    .property('serverpodSession'),
                refer('callContext').property('arguments'),
              ])
              .asA(method.returnType.reference(true, config: config))
              .returned
              .statement,
        ])
        ..returns,
    ).closure;

    return refer('callAwaitableFunctionAndHandleExceptions', serverpodTestUrl)
        .call([closure])
        .returned
        .statement;
  }

  Code _buildEndpointStreamMethodCall(
    EndpointDefinition endpoint,
    MethodDefinition method, {
    required hasStreamParameter,
    required returnsStream,
  }) {
    var parameters =
        method.parameters.where((p) => !p.type.isStreamType).toList();
    var streamParameters =
        method.parameters.where((p) => p.type.isStreamType).toList();

    var closure = Method(
      (methodBuilder) => methodBuilder
        ..modifier = MethodModifier.async
        ..body = Block.of([
          refer('var callContext')
              .assign(refer('_endpointDispatch')
                  .awaited
                  .property('getMethodStreamCallContext')
                  .call([], {
                'createSessionCallback': Method((methodBuilder) => methodBuilder
                  ..requiredParameters.add(
                    Parameter((p) => p..name = '_'),
                  )
                  ..body = refer('session')
                      .asA(refer('InternalTestSession', serverpodTestUrl))
                      .property('serverpodSession')
                      .code).closure,
                'endpointPath': literalString(endpoint.name),
                'methodName': literalString(method.name),
                'arguments': literalMap({
                  for (var parameter in parameters)
                    literalString(parameter.name): refer(parameter.name).code,
                }),
                'requestedInputStreams':
                    literalList(streamParameters.map((p) => p.name)),
                'serializationManager': refer('_serializationManager'),
              }))
              .statement,
          refer('callContext')
              .property('method')
              .property('call')
              .call([
                refer('session')
                    .asA(refer('InternalTestSession', serverpodTestUrl))
                    .property('serverpodSession'),
                refer('callContext').property('arguments'),
                literalMap({
                  for (var parameter in streamParameters)
                    literalString(parameter.name): refer(parameter.name),
                }),
              ])
              .asA(method.returnType.reference(true, config: config))
              .returned
              .statement,
        ])
        ..returns,
    ).closure;

    var exceptionHandlerFunctionName = returnsStream
        ? 'callStreamFunctionAndHandleExceptions'
        : 'callAwaitableFunctionAndHandleExceptions';

    return refer(exceptionHandlerFunctionName, serverpodTestUrl)
        .call([closure])
        .returned
        .statement;
  }

  Class _buildTestEndpointsClass() {
    return Class((classBuilder) {
      classBuilder
        ..name = 'TestEndpoints'
        ..extend = refer('TestEndpointsBase', serverpodTestUrl)
        ..methods.add(Method(
          (methodBuilder) {
            methodBuilder
              ..name = 'initialize'
              ..annotations.add(refer('override'))
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'serializationManager'
                    ..type = refer('SerializationManager', serverpodUrl(true)),
                ),
              )
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'endpoints'
                    ..type = refer('EndpointDispatch', serverpodUrl(true)),
                ),
              )
              ..body = Block.of(
                [
                  for (var endpoint in protocolDefinition.endpoints)
                    refer(endpoint.name)
                        .assign(
                          refer(endpoint.className).newInstance(
                            [
                              refer('endpoints'),
                              refer('serializationManager'),
                            ],
                          ),
                        )
                        .statement,
                ],
              );
          },
        ));

      for (var endpoint in protocolDefinition.endpoints) {
        classBuilder.fields.add(
          Field(
            (fieldBuilder) {
              fieldBuilder
                ..name = endpoint.name
                ..modifier = FieldModifier.final$
                ..type = refer(endpoint.className)
                ..late = true;
            },
          ),
        );
      }
    });
  }

  Method _buildWithServerpodFunction() {
    return Method((methodBuilder) {
      methodBuilder
        ..name = 'withServerpod'
        ..annotations.add(refer('isTestGroup', serverpodTestUrl))
        ..requiredParameters.addAll([
          Parameter((p) => p
            ..name = 'testGroupName'
            ..type = refer('String')),
          Parameter((p) => p
            ..name = 'testClosure'
            ..type = refer('TestClosure<TestEndpoints>', serverpodTestUrl)),
        ])
        ..optionalParameters.addAll([
          Parameter((p) => p
            ..name = 'resetStateBetweenTests'
            ..named = true
            ..type = refer('bool?')),
        ])
        ..body =
            refer('buildWithServerpod<TestEndpoints>', serverpodTestUrl).call(
          [
            refer('TestServerpod', serverpodTestUrl).newInstance(
              [],
              {
                'testEndpoints': refer('TestEndpoints').newInstance([]),
                'endpoints': refer('Endpoints').newInstance([]),
                'serializationManager': refer('Protocol').newInstance([]),
              },
            ),
          ],
          {
            'resetStateBetweenTests': refer('resetStateBetweenTests'),
          },
        ).call([
          refer('testGroupName'),
          refer('testClosure'),
        ]).statement;
    });
  }

  void _addPackageDirectives(LibraryBuilder library) {
    var protocolPackageImportPath = 'package:${config.name}_server/${p.joinAll([
          ...config.generatedServeModelPackagePathParts,
          'protocol.dart'
        ])}';
    var endpointsPath = 'package:${config.name}_server/${p.joinAll([
          ...config.generatedServeModelPackagePathParts,
          'endpoints.dart'
        ])}';

    library.directives.addAll([
      Directive.import(protocolPackageImportPath),
      Directive.import(endpointsPath),
      Directive.export(serverpodTestUrl, show: const [
        'TestSession',
        'UnauthenticatedEndpointCallTestException',
        'InsufficientEndpointAccessTestException'
      ]),
    ]);
  }
}
