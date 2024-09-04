import 'package:serverpod/serverpod.dart';
import 'package:serverpod/src/database/database.dart';
import 'package:test/test.dart';

export 'package:meta/meta.dart' show isTestGroup;

abstract class TestSession implements DatabaseAccessor {
  AuthenticationInfo? get authenticationInfo;

  Future<TestSession> copyWith({
    AuthenticationInfo? Function()? getAuthenticationInfo,
  });
}

class _TestSessionManager {
  static Map<int, InternalTestSession> _sessions = {};

  static int _sessionIdCounter = 0;

  static int add(InternalTestSession session) {
    _sessionIdCounter++;
    _sessions.putIfAbsent(_sessionIdCounter, () => session);
    return _sessionIdCounter;
  }

  static removeSession(int sessionId) {
    assert(_sessions.remove(sessionId) != null);
  }
}

class InternalTestSession extends TestSession {
  InternalTestSession(TestServerpod testServerpod,
      {AuthenticationInfo? authenticationInfo,
      required bool resetStateBetweenTests})
      : _authenticationInfo = authenticationInfo,
        _testServerpod = testServerpod,
        _resetStateBetweenTests = resetStateBetweenTests {
    _sessionId = _TestSessionManager.add(this);
  }

  final TestServerpod _testServerpod;

  late Session serverpodSession;

  AuthenticationInfo? _authenticationInfo;

  late int _sessionId;

  final bool _resetStateBetweenTests;

  void setAndConfigureServerpodSession(Session session) {
    serverpodSession = session;
    serverpodSession.updateAuthenticated(_authenticationInfo);
  }

  @override
  Future<TestSession> copyWith(
      {AuthenticationInfo? Function()? getAuthenticationInfo}) async {
    var newSession = InternalTestSession(
      _testServerpod,
      authenticationInfo: getAuthenticationInfo != null
          ? getAuthenticationInfo()
          : _authenticationInfo,
      resetStateBetweenTests: _resetStateBetweenTests,
    );

    var newServerpodSession = await _testServerpod.createSession();

    newSession.setAndConfigureServerpodSession(newServerpodSession);

    return newSession;
  }

  Future<void> resetState() async {
    await serverpodSession.close();
    _authenticationInfo = null;
    var newServerpodSession = await _testServerpod.createSession();
    setAndConfigureServerpodSession(newServerpodSession);
  }

  Future<void> destroy() async {
    await serverpodSession.close();
    _TestSessionManager.removeSession(_sessionId);
  }

  @override
  Database get db => serverpodSession.db;

  @override
  AuthenticationInfo? get authenticationInfo => _authenticationInfo;
}

// TODO(hampusl): Rename class
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
          // TODO(hampusl): Fix so that .test run mode is working
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

/// The user was not authenticated.
class UnauthenticatedEndpointCallTestException implements Exception {
  UnauthenticatedEndpointCallTestException();
}

/// The authentication key provided did not have sufficient access.
class InsufficientEndpointAccessTestException implements Exception {
  InsufficientEndpointAccessTestException();
}

Future<T> callAwaitableFunctionAndHandleExceptions<T>(
  Future<T> Function() call,
) async {
  try {
    return await call();
  } catch (e) {
    throw _getException(e);
  }
}

Stream<T> callStreamFunctionAndHandleExceptions<T>(
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
  var unexpectedError = StateError(
      'An unexpected error occured while trying to call the endpoint in the test. '
      'Make sure you have run `serverpod generate`.');

  if (e is NotAuthorizedException) {
    return switch (e.authenticationFailedResult.reason) {
      AuthenticationFailureReason.unauthenticated =>
        UnauthenticatedEndpointCallTestException(),
      AuthenticationFailureReason.insufficientAccess =>
        InsufficientEndpointAccessTestException(),
    };
  } else if (e is MethodNotFoundException) {
    return unexpectedError;
  } else if (e is EndpointNotFoundException) {
    return unexpectedError;
  } else if (e is InvalidParametersException) {
    return unexpectedError;
  } else if (e is InvalidEndpointMethodTypeException) {
    return unexpectedError;
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
  TestServerpod<T> testServerpod, {
  bool? resetStateBetweenTests = true,
}) {
  var _resetStateBetweenTests = resetStateBetweenTests ?? true;
  return (
    String testGroupName,
    TestClosure<T> testClosure,
  ) {
    group(testGroupName, () {
      InternalTestSession testSession = InternalTestSession(testServerpod,
          resetStateBetweenTests: _resetStateBetweenTests);

      setUpAll(() async {
        await testServerpod.start();
        var serverpodSession = await testServerpod.createSession();
        testSession.setAndConfigureServerpodSession(serverpodSession);
      });

      tearDownAll(() async {
        await testServerpod.shutdown();
        for (var session in _TestSessionManager._sessions.values) {
          await session.destroy();
        }
      });

      tearDown(() async {
        if (_resetStateBetweenTests) {
          for (var session in _TestSessionManager._sessions.values) {
            await session.resetState();
          }
        }
      });
      testClosure(testServerpod.testEndpoints, testSession);
    });
  };
}
