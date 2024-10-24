import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';
import 'package:serverpod_cli/src/analyzer/models/definitions.dart';
import 'package:serverpod_cli/src/config/config.dart';
import 'package:path/path.dart' as p;
import 'package:serverpod_cli/src/generator/shared.dart';

class BuildScaffoldEndpointClass {
  final bool serverCode;
  final GeneratorConfig config;

  BuildScaffoldEndpointClass({
    required this.serverCode,
    required this.config,
  });

  Library generateScaffolds(ClassDefinition classDefinition) {
    var library = LibraryBuilder();
    String? tableName = classDefinition.tableName;
    var className = classDefinition.className;
    var fields = classDefinition.fieldsIncludingInherited;

    _addPackageDirectives(library);

    library.body.addAll(
      [
        _buildScaffoldEndpointClass(
          classDefinition.className,
          classDefinition.fieldsIncludingInherited,
          classDefinition,
        ),
      ],
    );

    return library.build();
  }

  Class _buildScaffoldEndpointClass(
    String className,
    List<SerializableModelFieldDefinition> fields,
    ClassDefinition classDefinition,
  ) {
    var relationFields = fields.where((field) =>
        field.relation is ObjectRelationDefinition ||
        field.relation is ListRelationDefinition);
    return Class((classBuilder) {
      classBuilder
        ..name = '${className}Endpoint'
        ..fields.addAll([])
        ..methods.addAll([
          _buildScaffoldEndpointMethodCreate(
            className,
            classDefinition,
          ),
          _buildScaffoldEndpointMethodRead(
            className,
            classDefinition,
          ),
          _buildScaffoldEndpointMethodUpdate(
            className,
            classDefinition,
          ),
          _buildScaffoldEndpointMethodDelete(
            className,
            classDefinition,
          ),
        ]);
    });
  }

  Method _buildScaffoldEndpointMethodCreate(
    String className,
    ClassDefinition classDefinition,
  ) {
    return Method((builder) {
      builder
        ..name = 'create'
        ..modifier = MethodModifier.async
        ..requiredParameters.addAll([
          Parameter((b) => b
            ..name = 'session'
            ..type = refer('Session', serverpodUrl(true))),
          Parameter(
            (b) => b
              ..name = className.camelCase
              ..type = refer(className),
          ),
        ])
        ..returns = refer('Future<$className>')
        ..body = Block.of([
          refer(className)
              .property('db')
              .property('insertRow')
              .call([refer('session'), refer(className.camelCase)])
              .returned
              .statement,
        ]);
    });
  }

  Method _buildScaffoldEndpointMethodRead(
    String className,
    ClassDefinition classDefinition,
  ) {
    return Method((builder) {
      builder
        ..name = 'read'
        ..modifier = MethodModifier.async
        ..requiredParameters.addAll([
          Parameter((b) => b
            ..name = 'session'
            ..type = refer('Session', serverpodUrl(true))),
          Parameter(
            (b) => b
              ..name = '${className.camelCase}Id'
              ..type = refer('int'),
          ),
        ])
        ..returns = refer('Future<$className?>')
        ..body = Block.of([
          refer(className)
              .property('db')
              .property('findById')
              .call([refer('session'), refer('${className.camelCase}Id')])
              .returned
              .statement,
        ]);
    });
  }

  Method _buildScaffoldEndpointMethodUpdate(
    String className,
    ClassDefinition classDefinition,
  ) {
    return Method((builder) {
      builder
        ..name = 'update'
        ..modifier = MethodModifier.async
        ..requiredParameters.addAll([
          Parameter((b) => b
            ..name = 'session'
            ..type = refer('Session', serverpodUrl(true))),
          Parameter(
            (b) => b
              ..name = className.camelCase
              ..type = refer(className),
          ),
        ])
        ..returns = refer('Future<$className>')
        ..body = Block.of([
          refer(className)
              .property('db')
              .property('updateRow')
              .call([refer('session'), refer(className.camelCase)])
              .returned
              .statement,
        ]);
    });
  }

  Method _buildScaffoldEndpointMethodDelete(
    String className,
    ClassDefinition classDefinition,
  ) {
    return Method((builder) {
      builder
        ..name = 'delete'
        ..modifier = MethodModifier.async
        ..requiredParameters.addAll([
          Parameter((b) => b
            ..name = 'session'
            ..type = refer('Session', serverpodUrl(true))),
          Parameter(
            (b) => b
              ..name = '${className.camelCase}Id'
              ..type = refer('int'),
          ),
        ])
        ..returns = refer('Future<$className?>')
        ..body = Block.of([
          refer(className)
              .property('db')
              .property('deleteWhere')
              .call([
                refer('session')
              ], {
                'where': Method(
                  (b) => b
                    ..requiredParameters.add(Parameter((p) => p..name = 't'))
                    ..body = refer('t.id')
                        .property('equals')
                        .call([refer('${className.camelCase}Id')])
                        .returned
                        .statement,
                ).closure,
              })
              .awaited
              .parenthesized
              .property('first')
              .returned
              .statement,
        ]);
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
    ]);
  }
}
