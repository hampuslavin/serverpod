import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:serverpod_cli/analyzer.dart';
import 'package:serverpod_cli/src/analyzer/models/stateful_analyzer.dart';
import 'package:serverpod_cli/src/generator/code_generation_collector.dart';
import 'package:serverpod_cli/src/generator/dart/server_scaffold_code_generator.dart';
import 'package:serverpod_cli/src/util/internal_error.dart';
import 'package:serverpod_cli/src/util/model_helper.dart';
import 'package:serverpod_cli/src/util/serverpod_cli_logger.dart';

import 'interactive_checklist.dart';

abstract final class Scaffolder {
  static Future<bool> performScaffold({
    required GeneratorConfig config,
    required EndpointsAnalyzer endpointsAnalyzer,
  }) async {
    var collector = CodeGenerationCollector();
    bool success = true;

    log.debug('Analyzing serializable models in the protocol directory.');
    var protocols = await ModelHelper.loadProjectYamlModelsFromDisk(config);

    var analyzer = StatefulAnalyzer(config, protocols, (uri, collector) {
      collector.printErrors();

      if (collector.hasSeverErrors) {
        success = false;
      }
    });

    var models = analyzer.validateAll();

    // final checklist = InteractiveChecklist([
    //   for (var model in models) ChecklistOption(model.className),
    // ]);

    // final results = await checklist.show();

    // // Access selected items
    // for (var option in results.where((opt) => opt.selected)) {
    //   // Do something with selected options
    //   print('Selected: ${option.label}');
    // }

    var chosenModels = models.take(1).whereType<ClassDefinition>().toList();

    var codeMap = const DartServerScaffoldCodeGenerator()
        .generateEndpoints(config: config, models: chosenModels);

    for (var file in codeMap.entries) {
      try {
        log.debug('Generating ${file.key}.');
        var out = File(file.key);
        await out.create(recursive: true);
        await out.writeAsString(file.value, flush: true);

        collector.addGeneratedFile(out);
      } catch (e, stackTrace) {
        log.error('Failed to generate ${file.key}');
        printInternalError(e, stackTrace);
      }
    }

    log.debug('Generating endpoint for serializable models.');

    return success;
  }
}
