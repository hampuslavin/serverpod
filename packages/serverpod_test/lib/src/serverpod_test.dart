import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

export 'package:meta/meta.dart' show isTestGroup;

abstract class TestSession {
  TestSession();

  Future<TestSession> copyWith({
    AuthenticationInfo? authenticationInfo,
  });
}

class InternalTestSession extends TestSession {
  InternalTestSession(TestServerpod testServerpod, {authenticationInfo})
      : _authenticationInfo = authenticationInfo,
        _testServerpod = testServerpod;

  final TestServerpod _testServerpod;

  late Session serverpodSession;

  AuthenticationInfo? _authenticationInfo;

  void setAndConfigureServerpodSession(Session session) {
    serverpodSession = session;
    serverpodSession.updateAuthenticated(_authenticationInfo);
  }

  @override
  Future<TestSession> copyWith({AuthenticationInfo? authenticationInfo}) async {
    await serverpodSession.close();

    var newSession = InternalTestSession(_testServerpod,
        authenticationInfo: authenticationInfo ?? _authenticationInfo);

    var newServerpodSession = await _testServerpod.createSession();

    newSession.setAndConfigureServerpodSession(newServerpodSession);

    return newSession;
  }

  Future<void> destroy() async {
    await serverpodSession.close();
  }
}

abstract class TestEndpointsBase {
  // TODO(hampusl): Hide this in public API
  initialize(
    SerializationManagerServer serializationManager,
    EndpointDispatch endpoints,
  );
}

class TestServerpod<T extends TestEndpointsBase> {
  T testEndpoints;

  Serverpod _serverpod;

  TestServerpod({
    required this.testEndpoints,
    required SerializationManagerServer serializationManager,
    required EndpointDispatch endpoints,
  }) : _serverpod = Serverpod(
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
    return await call();
  } catch (e) {
    throw _getException(e);
  }
}

Stream<T> callEndpointStreamMethodAndHandleExceptions<T>(
  Future<Stream<T>> Function() call,
) async* {
  try {
    var result = await call();
    await for (var item in result) {
      yield item;
    }
  } catch (e) {
    throw _getException(e);
  }
}

dynamic _getException(dynamic e) {
  if (e is NotAuthorizedException) {
    // Two new test exceptions: InsufficientAccess, NotAuthenticated
    return Exception("Not authorized.");
  } else if (e is MethodNotFoundException) {
    // provide hint on "impossible" states to regenerate
    return StateError("Invalid test state: $e");
  } else if (e is EndpointNotFoundException) {
    return StateError("Invalid test state: $e");
  } else if (e is InvalidParametersException) {
    return StateError("Invalid test state: $e");
  } else if (e is InvalidEndpointMethodTypeException) {
    return StateError("Invalid test state: $e");
  } else {
    return e;
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
      InternalTestSession testSession = InternalTestSession(testServerpod);

      setUpAll(() async {
        await testServerpod.start();
        var serverpodSession = await testServerpod.createSession();
        testSession.setAndConfigureServerpodSession(serverpodSession);
      });

      tearDownAll(() async {
        await testServerpod.shutdown();
        await testSession.destroy();
      });

      // tearDown(() async {
      //   await testSession.destroy();
      //   testSession = InternalTestSession();
      //   var serverpodSession = await testServerpod.createSession();
      //   testSession.setServerpodSession(serverpodSession);
      // });

      testClosure(testServerpod.testEndpoints, testSession);
    });
  };
}
