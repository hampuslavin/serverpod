import 'package:path/path.dart' as path;
import 'package:recase/recase.dart';
import 'package:serverpod_cli/src/analyzer/dart/definitions.dart';
import 'package:serverpod_cli/src/analyzer/protocol_definition.dart';
import 'package:serverpod_cli/src/generator/dart/server_code_generator.dart';
import 'package:serverpod_cli/src/test_util/builders/endpoint_definition_builder.dart';
import 'package:serverpod_cli/src/test_util/builders/generator_config_builder.dart';
import 'package:serverpod_cli/src/test_util/builders/method_definition_builder.dart';
import 'package:serverpod_cli/src/test_util/builders/type_definition_builder.dart';
import 'package:test/test.dart';

const projectName = 'example_project';
final config = GeneratorConfigBuilder().withName(projectName).build();
const generator = DartServerCodeGenerator();

void main() {
  var expectedFileName = path.join(
    'integration_test',
    'test_tools',
    'serverpod_test_tools.dart',
  );
  group(
      'Given protocol definition without endpoints when generating test tools file',
      () {
    var protocolDefinition = const ProtocolDefinition(
      endpoints: [],
      models: [],
    );

    var codeMap = generator.generateProtocolCode(
      protocolDefinition: protocolDefinition,
      config: config,
    );

    test('then test tools file is created.', () {
      expect(codeMap, contains(expectedFileName));
    });

    var testToolsFile = codeMap[expectedFileName];

    test('then test tools file has `TestEndpoints` class defined.', () {
      expect(codeMap[expectedFileName], contains('class TestEndpoints'));
    }, skip: testToolsFile == null);
  });

  group(
      'Given protocol definition with endpoint when generating test tools file file',
      () {
    var endpointName = 'testing';
    var protocolDefinition = ProtocolDefinition(
      endpoints: [
        EndpointDefinitionBuilder()
            .withClassName('${endpointName.pascalCase}Endpoint')
            .withName(endpointName)
            .build(),
      ],
      models: [],
    );

    var codeMap = generator.generateProtocolCode(
      protocolDefinition: protocolDefinition,
      config: config,
    );

    test('then test tools file is created.', () {
      expect(codeMap, contains(expectedFileName));
    });

    var testToolsFile = codeMap[expectedFileName];

    test('then test tools file has `TestEndpoints` class defined.', () {
      expect(testToolsFile, contains('class TestEndpoints'));
    });

    test(
      'then test tools file has endpoint class defined.',
      () {
        expect(testToolsFile,
            contains('class ${endpointName.pascalCase}Endpoint'));
      },
      skip: testToolsFile == null,
    );
  });

  group(
      'Given protocol definition with multiple endpoints when generating test tools file',
      () {
    var firstEndpointName = 'testing1';
    var secondEndpointName = 'testing2';
    var protocolDefinition = ProtocolDefinition(
      endpoints: [
        EndpointDefinitionBuilder()
            .withClassName('${firstEndpointName.pascalCase}Endpoint')
            .withName(firstEndpointName)
            .build(),
        EndpointDefinitionBuilder()
            .withClassName('${secondEndpointName.pascalCase}Endpoint')
            .withName(secondEndpointName)
            .build(),
      ],
      models: [],
    );

    var codeMap = generator.generateProtocolCode(
      protocolDefinition: protocolDefinition,
      config: config,
    );

    test('then test tools file is created.', () {
      expect(codeMap, contains(expectedFileName));
    });

    var testToolsFile = codeMap[expectedFileName];

    group(
      'then test tools file',
      () {
        test('has `TestEndpoints` class defined.', () {
          expect(testToolsFile, contains('class TestEndpoints'));
        });

        test(
          'has endpoint class defined.',
          () {
            expect(testToolsFile,
                contains('class ${firstEndpointName.pascalCase}Endpoint'));
          },
        );

        test(
          'has endpoint class defined.',
          () {
            expect(testToolsFile,
                contains('class ${secondEndpointName.pascalCase}Endpoint'));
          },
        );
      },
      skip: testToolsFile == null,
    );
  });

  group(
      'Given a protocol definition with a method with Future return value when generating test tools file',
      () {
    var endpointName = 'testing';
    var protocolDefinition = ProtocolDefinition(
      endpoints: [
        EndpointDefinitionBuilder()
            .withClassName('${endpointName.pascalCase}Endpoint')
            .withName(endpointName)
            .withMethods([
          MethodDefinitionBuilder()
              .withName('futureMethod')
              .buildMethodStreamDefinition(),
        ]).build(),
      ],
      models: [],
    );

    var codeMap = generator.generateProtocolCode(
      protocolDefinition: protocolDefinition,
      config: config,
    );

    test('then test tools file is created.', () {
      expect(codeMap, contains(expectedFileName));
    });
    var testToolsFile = codeMap[expectedFileName];

    test('then test tools file contains the method definition.', () {
      expect(
          testToolsFile,
          matches(
              r'Future<String> futureMethod\(_i\d\.TestSession session\) async \{'));
    }, skip: testToolsFile == null);

    test(
        'then the method body contains a call to the correct exception handler function.',
        () {
      expect(
          testToolsFile, contains('callAwaitableFunctionAndHandleExceptions('));
    }, skip: testToolsFile == null);

    test('then the method body contains a call to the correct endpoint method.',
        () {
      expect(testToolsFile, contains('getMethodCallContext('));
    }, skip: testToolsFile == null);
  });

  group(
      'Given a protocol definition with a method with Stream return value when generating test tools file',
      () {
    var endpointName = 'testing';
    var protocolDefinition = ProtocolDefinition(
      endpoints: [
        EndpointDefinitionBuilder()
            .withClassName('${endpointName.pascalCase}Endpoint')
            .withName(endpointName)
            .withMethods([
          MethodDefinitionBuilder()
              .withName('streamMethod')
              .withReturnType(
                  TypeDefinitionBuilder().withStreamOf('String').build())
              .buildMethodStreamDefinition(),
        ]).build(),
      ],
      models: [],
    );

    var codeMap = generator.generateProtocolCode(
      protocolDefinition: protocolDefinition,
      config: config,
    );

    test('then test tools file is created.', () {
      expect(codeMap, contains(expectedFileName));
    });
    var testToolsFile = codeMap[expectedFileName];

    test('then test tools file contains the method definition.', () {
      expect(
          testToolsFile,
          matches(
              r'Stream<String> streamMethod\(_i\d\.TestSession session\) \{'));
    }, skip: testToolsFile == null);

    test(
        'then the method body contains a call to the correct exception handler function.',
        () {
      expect(testToolsFile, contains('callStreamFunctionAndHandleExceptions('));
    }, skip: testToolsFile == null);

    test('then the method body contains a call to the correct endpoint method.',
        () {
      expect(testToolsFile, contains('getMethodStreamCallContext('));
    }, skip: testToolsFile == null);
  });

  group(
      'Given a protocol definition with a method with only a Stream parameter when generating test tools file',
      () {
    var endpointName = 'testing';
    var methodName = 'streamMethod';
    var protocolDefinition = ProtocolDefinition(
      endpoints: [
        EndpointDefinitionBuilder()
            .withClassName('${endpointName.pascalCase}Endpoint')
            .withName(endpointName)
            .withMethods([
          MethodDefinitionBuilder().withName(methodName).withParameters([
            ParameterDefinition(
              name: 'streamParam',
              type: TypeDefinitionBuilder().withStreamOf('String').build(),
              required: false,
            ),
          ]).buildMethodStreamDefinition(),
        ]).build(),
      ],
      models: [],
    );

    var codeMap = generator.generateProtocolCode(
      protocolDefinition: protocolDefinition,
      config: config,
    );

    test('then test tools file is created.', () {
      expect(codeMap, contains(expectedFileName));
    });

    var testToolsFile = codeMap[expectedFileName];

    test('then test tools file contains the method definition.', () {
      expect(
          testToolsFile,
          contains('  Future<String> streamMethod(\n'
              '    _i1.TestSession session,\n'
              '    Stream<String> streamParam,\n'
              '  ) async {'));
    }, skip: testToolsFile == null);

    test(
        'then the the method body contains a call to the correct exception handler function.',
        () {
      expect(
          testToolsFile, contains('callAwaitableFunctionAndHandleExceptions('));
    }, skip: testToolsFile == null);

    test('then the method body contains a call to the correct endpoint method.',
        () {
      expect(testToolsFile, contains('getMethodStreamCallContext('));
    }, skip: testToolsFile == null);
  });

  group(
      'Given a protocol definition with a method with Stream return value and Stream parameter when generating test tools file',
      () {
    var endpointName = 'testing';
    var methodName = 'streamMethod';
    var protocolDefinition = ProtocolDefinition(
      endpoints: [
        EndpointDefinitionBuilder()
            .withClassName('${endpointName.pascalCase}Endpoint')
            .withName(endpointName)
            .withMethods([
          MethodDefinitionBuilder()
              .withName(methodName)
              .withParameters([
                ParameterDefinition(
                  name: 'streamParam',
                  type: TypeDefinitionBuilder().withStreamOf('String').build(),
                  required: false,
                ),
              ])
              .withReturnType(
                  TypeDefinitionBuilder().withStreamOf('String').build())
              .buildMethodStreamDefinition(),
        ]).build(),
      ],
      models: [],
    );

    var codeMap = generator.generateProtocolCode(
      protocolDefinition: protocolDefinition,
      config: config,
    );

    test('then test tools file is created.', () {
      expect(codeMap, contains(expectedFileName));
    });

    var testToolsFile = codeMap[expectedFileName];

    test('then test tools file contains the method definition.', () {
      expect(
          testToolsFile,
          contains('  Stream<String> streamMethod(\n'
              '    _i1.TestSession session,\n'
              '    Stream<String> streamParam,\n'
              '  ) {'));
    }, skip: testToolsFile == null);

    test(
        'then the the method body contains a call to the correct exception handler function.',
        () {
      expect(testToolsFile, contains('callStreamFunctionAndHandleExceptions('));
    }, skip: testToolsFile == null);

    test('then the method body contains a call to the correct endpoint method.',
        () {
      expect(testToolsFile, contains('getMethodStreamCallContext('));
    }, skip: testToolsFile == null);
  });
}
