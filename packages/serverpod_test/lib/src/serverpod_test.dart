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
          ['-m', ServerpodRunMode.test],
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
  resetStateBetweenTests = true,
}) {
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

      if (resetStateBetweenTests) {
        tearDown(() async {
          testSession = await testSession.copyWith() as InternalTestSession;
        });
      }
      testClosure(testServerpod.testEndpoints, testSession);
    });
  };
}
