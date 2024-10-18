import 'package:code_builder/code_builder.dart';
import 'package:serverpod_cli/src/analyzer/models/definitions.dart';
import 'package:serverpod_cli/src/config/config.dart';
import 'package:path/path.dart' as p;

class BuildScaffoldEndpointClass {
  final bool serverCode;
  final GeneratorConfig config;

  BuildScaffoldEndpointClass({
    required this.serverCode,
    required this.config,
  });

  Library generateTestHelper(ClassDefinition classDefinition) {
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
          for (var field in fields)
            _buildScaffoldEndpointMethod(
              className,
              field,
              classDefinition,
            ),
        ]);
    });
  }

  _buildScaffoldEndpointMethod(
      String className,
      SerializableModelFieldDefinition field,
      ClassDefinition classDefinition) {}

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

    library.ignoreForFile.add('no_leading_underscores_for_local_identifiers');
  }
}
