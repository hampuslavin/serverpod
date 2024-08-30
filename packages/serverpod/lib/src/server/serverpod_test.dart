import 'package:meta/meta.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

class TestSession {
  Session? _session;

  TestSession();

  setSession(Session session) {
    return _session = session;
  }

  get session => _session;
}

// TODO(hampusl): generate the actual TestServerpod which can then include the generated endpoints
class TestServerpod {
  static SerializationManagerServer? _staticSerializationManager;
  static EndpointDispatch? _staticEndpoints;

  Serverpod _serverpod;

  TestServerpod()
      : _serverpod = Serverpod(
          ['-m', ServerpodRunMode.development],
          _staticSerializationManager!,
          _staticEndpoints!,
        ),
        testEndpoints =
            TestEndpoints(_staticEndpoints!, _staticSerializationManager!);

  Future<void> start() async {
    await _serverpod.start();
  }

  Future<void> shutdown() async {
    await _serverpod.shutdown();
  }

  Future<Session> createSession({bool enableLogging = false}) async {
    return _serverpod.createSession(enableLogging: enableLogging);
  }

  static void initialize(
    SerializationManagerServer serializationManager,
    EndpointDispatch endpoints,
  ) {
    _staticSerializationManager = serializationManager;
    _staticEndpoints = endpoints;
  }

  TestEndpoints testEndpoints;
  dynamic relic;
}

// TODO(hampusl): generate the actual TestEndpoints
class TestEndpoints {
  TestEndpoints(EndpointDispatch _endpointDispatch,
      SerializationManager _serializationManager)
      : example = ExampleEndpoint(_endpointDispatch, _serializationManager);
  //Dummy example
  final ExampleEndpoint example;
}

// This would be a modified version of the actual user endpoint
class ExampleEndpoint {
  EndpointDispatch _endpointDispatch;
  SerializationManager _serializationManager;
  ExampleEndpoint(this._endpointDispatch, this._serializationManager);

  Future<String> hello(TestSession session, String name) async {
    try {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => session.session,
        endpointPath: 'example',
        methodName: 'hello',
        parameters: {'name': name},
        serializationManager: _serializationManager,
      );

      return (await callContext.method
          .call(session.session, callContext.arguments)) as String;
    } on NotAuthorizedException {
      // TODO(hampusl): This should be a proper exception, perhaps a specific test exception
      throw Exception("Not authorized.");
    } catch (e) {
      throw StateError("Invalid test state.");
    }
  }
}

typedef TestClosure = void Function(
  TestEndpoints endpoints,
  TestSession testSession,
);

@isTestGroup
void withServerpod(
  String testGroupName,
  TestClosure testClosure,
) {
  group(testGroupName, () {
    TestServerpod testServerpod = TestServerpod();
    TestSession testSession = TestSession();
    setUpAll(() async {
      print(">>>>>>>>Starting serverpod");
      // could create serverpod outside TestServerpod so that we don't have to expose create session and so on
      await testServerpod.start();
      print(">>>>>>>>Serverpod started");
      var session = await testServerpod.createSession();
      testSession.setSession(session);
    });

    tearDownAll(() async {
      await testServerpod.shutdown();
    });

    testClosure(testServerpod.testEndpoints, testSession);
  });
}
