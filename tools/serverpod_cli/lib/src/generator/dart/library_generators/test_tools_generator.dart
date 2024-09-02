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

    _addPackageImports(library);

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
    return Class((classBuilder) {
      classBuilder
        ..name = endpoint.className
        ..fields.addAll([
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
        ])
        ..constructors.add(
          Constructor(
            (constructorBuilder) {
              constructorBuilder.requiredParameters.addAll(
                [
                  Parameter(
                    (p) => p
                      ..name = '_endpointDispatch'
                      ..toThis = true,
                  ),
                  Parameter(
                    (p) => p
                      ..name = '_serializationManager'
                      ..toThis = true,
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
        methodBuilder
          ..name = method.name
          ..modifier = MethodModifier.async
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

        var endpointCallClosure = Method(
          (methodBuilder) => methodBuilder
            ..modifier = MethodModifier.async
            ..body = Block.of([
              refer('var callContext')
                  .assign(refer('_endpointDispatch')
                      .awaited
                      .property('getMethodCallContext')
                      .call([], {
                    'createSessionCallback': Method((methodBuilder) =>
                            methodBuilder
                              ..requiredParameters.add(
                                Parameter((p) => p..name = '_'),
                              )
                              ..body =
                                  refer('session').property('session').code)
                        .closure,
                    'endpointPath': literalString(endpoint.name),
                    'methodName': literalString(method.name),
                    'parameters': literalMap({
                      for (var parameter in method.parameters)
                        literalString(parameter.name):
                            refer(parameter.name).code,
                    }),
                    'serializationManager': refer('_serializationManager'),
                  }))
                  .statement,
              refer('callContext')
                  .property('method')
                  .property('call')
                  .call([
                    refer('session').property('session'),
                    refer('callContext').property('arguments'),
                  ])
                  .asA(method.returnType.reference(true, config: config))
                  .returned
                  .statement,
            ])
            ..returns,
        ).closure;

        methodBuilder.body =
            refer('callEndpointMethodAndHandleExceptions', serverpodTestUrl)
                .call([endpointCallClosure])
                .returned
                .statement;
      },
    );
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
        ).call([
          refer('testGroupName'),
          refer('testClosure'),
        ]).statement;
    });
  }

  void _addPackageImports(LibraryBuilder library) {
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
    ]);
  }
}
