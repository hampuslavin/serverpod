import 'dart:io';

import 'package:cli_tools/cli_tools.dart';
import 'package:path/path.dart' as path;
import 'package:pub_semver/pub_semver.dart';
import 'package:serverpod_cli/analyzer.dart';
import 'package:serverpod_cli/src/create/create.dart';
import 'package:serverpod_cli/src/generated/version.dart';
import 'package:serverpod_cli/src/runner/serverpod_command.dart';
import 'package:serverpod_cli/src/serverpod_packages_version_check/serverpod_packages_version_check.dart';
import 'package:serverpod_cli/src/util/serverpod_cli_logger.dart';

import '../scaffold/scaffolder.dart';

class ScaffoldCommand extends ServerpodCommand {
  final templateTypes =
      ServerpodTemplateType.values.map((t) => t.name).toList();

  @override
  final name = 'scaffold';

  @override
  final description = 'Scaffolds endpoints based on model files';

  ScaffoldCommand() {}

  @override
  Future<void> run() async {
    GeneratorConfig config;
    try {
      config = await GeneratorConfig.load();
    } catch (e) {
      log.error('An error occurred while parsing the server config file: $e');
      throw ExitException(ExitCodeType.commandInvokedCannotExecute);
    }

    // Validate cli version is compatible with serverpod packages
    var warnings = performServerpodPackagesAndCliVersionCheck(
        Version.parse(templateVersion), Directory.current.parent);
    if (warnings.isNotEmpty) {
      log.warning(
        'The version of the CLI may be incompatible with the Serverpod '
        'packages used in your project.',
      );
      for (var warning in warnings) {
        log.sourceSpanException(warning);
      }
    }

    var endpointDirectory =
        Directory(path.joinAll(config.endpointsSourcePathParts));
    var endpointsAnalyzer = EndpointsAnalyzer(endpointDirectory);

    if (!await Scaffolder.performScaffold(
      endpointsAnalyzer: endpointsAnalyzer,
      config: config,
    )) {
      throw ExitException();
    }
  }
}
