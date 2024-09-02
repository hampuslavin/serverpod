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

Future<T> callEndpointMethodAndHandleExceptions<T>(
  Future<T> Function() call,
) async {
  try {
    return call();
  } on NotAuthorizedException catch (e) {
    print('Not authorized: $e');
    // TODO(hampusl): Should we throw a different exception here?
    throw Exception("Not authorized.");
  } on MethodNotFoundException catch (e) {
    throw StateError("Invalid test state: $e");
  } on EndpointNotFoundException catch (e) {
    throw StateError("Invalid test state: $e");
  } on InvalidParametersException catch (e) {
    throw StateError("Invalid test state: $e");
  } on InvalidEndpointMethodTypeException catch (e) {
    throw StateError("Invalid test state: $e");
  } on Exception catch (e) {
    throw StateError("Invalid test state: $e");
  } catch (e) {
    throw StateError("Invalid test state: $e");
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
        await testServerpod.start();
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
