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
  } on NotAuthorizedException catch (_) {
    // TODO(hampusl): Should we throw a different exception here?
    // Two new test exceptions: InsufficientAccess, NotAuthenticated
    throw Exception("Not authorized.");
  } on MethodNotFoundException catch (e) {
    // provide hint on "impossible" states to regenerate
    throw StateError("Invalid test state: $e");
  } on EndpointNotFoundException catch (e) {
    throw StateError("Invalid test state: $e");
  } on InvalidParametersException catch (e) {
    throw StateError("Invalid test state: $e");
  } on InvalidEndpointMethodTypeException catch (e) {
    throw StateError("Invalid test state: $e");
  } catch (_) {
    rethrow;
  }
}

Stream<T> callEndpointStreamMethodAndHandleExceptions<T>(
  Stream<T> Function() call,
) {
  try {
    return call();
  } on NotAuthorizedException catch (e) {
    // TODO(hampusl): Should we throw a different exception here?
    // Two new test exceptions: InsufficientAccess, NotAuthenticated
    throw Exception("Not authorized.");
  } on MethodNotFoundException catch (e) {
    // provide hint on "impossible" states to regenerate
    throw StateError("Invalid test state: $e");
  } on EndpointNotFoundException catch (e) {
    throw StateError("Invalid test state: $e");
  } on InvalidParametersException catch (e) {
    throw StateError("Invalid test state: $e");
  } on InvalidEndpointMethodTypeException catch (e) {
    throw StateError("Invalid test state: $e");
  } catch (_) {
    rethrow;
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
