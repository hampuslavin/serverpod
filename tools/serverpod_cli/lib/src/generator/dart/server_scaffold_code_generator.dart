import 'package:path/path.dart' as p;
import 'package:recase/recase.dart';
import 'package:serverpod_cli/analyzer.dart';
import 'package:serverpod_cli/src/generator/code_generator.dart';
import 'package:serverpod_cli/src/generator/dart/library_generators/class_generators/endpoint_classes.dart';

/// A [CodeGenerator] that generates the server side dart code of a
/// serverpod project.
class DartServerScaffoldCodeGenerator {
  const DartServerScaffoldCodeGenerator();

  Map<String, String> generateEndpoints({
    required GeneratorConfig config,
    required List<ClassDefinition> models,
  }) {
    var serverClassGenerator = BuildScaffoldEndpointClass(
      serverCode: true,
      config: config,
    );
    Map<String, String> codeMap = {};

    for (var model in models) {
      codeMap[p.joinAll([
        ...config.libSourcePathParts,
        'endpoints',
        '${model.className.snakeCase}.g.dart'
      ])] = serverClassGenerator.generateScaffolds(model).generateCode();
    }

    return codeMap;
  }
}
