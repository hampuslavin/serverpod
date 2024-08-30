import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

export 'package:meta/meta.dart' show isTestGroup;

class TestSession {
  Session? _session;

  TestSession();

  setSession(Session session) {
    return _session = session;
  }

  get session => _session;
}

abstract class TestEndpointsBase {
  initialize(
    SerializationManagerServer serializationManager,
    EndpointDispatch endpoints,
  );
}

class TestServerpod<T extends TestEndpointsBase> {
  T testEndpoints;

  Serverpod _serverpod;

  TestServerpod(
      {required this.testEndpoints,
      required SerializationManagerServer serializationManager,
      required EndpointDispatch endpoints})
      : _serverpod = Serverpod(
          ['-m', ServerpodRunMode.development],
          serializationManager,
          endpoints,
        ) {
    endpoints.initializeEndpoints(_serverpod.server);
    testEndpoints.initialize(serializationManager, endpoints);
  }

  Future<void> start() async {
    await _serverpod.start();
  }

  Future<void> shutdown() async {
    await _serverpod.shutdown();
  }

  Future<Session> createSession({bool enableLogging = false}) async {
    return _serverpod.createSession(enableLogging: enableLogging);
  }
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

typedef TestClosure<T> = void Function(
  T endpoints,
  TestSession testSession,
);

Function(String, TestClosure<T>)
    buildWithServerpod<T extends TestEndpointsBase>(
  TestServerpod<T> testServerpod,
) {
  return (
    String testGroupName,
    TestClosure<T> testClosure,
  ) {
    group(testGroupName, () {
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
  };
}

// @isTestGroup
// void withServerpod(
//   String testGroupName,
//   TestClosure testClosure,
// ) {
//   group(testGroupName, () {
//     TestServerpod testServerpod = TestServerpod();
//     TestSession testSession = TestSession();
//     setUpAll(() async {
//       print(">>>>>>>>Starting serverpod");
//       // could create serverpod outside TestServerpod so that we don't have to expose create session and so on
//       await testServerpod.start();
//       print(">>>>>>>>Serverpod started");
//       var session = await testServerpod.createSession();
//       testSession.setSession(session);
//     });

//     tearDownAll(() async {
//       await testServerpod.shutdown();
//     });

//     testClosure(testServerpod.testEndpoints, testSession);
//   });
// }
