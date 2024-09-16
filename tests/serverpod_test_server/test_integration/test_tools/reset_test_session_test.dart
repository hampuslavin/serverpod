import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'serverpod_test_tools.dart';

void main() {
  withServerpod(
    'Given no explicit resetTestSessions configuration when having multiple test cases',
    (endpoints, session) {
      group('when copying the session in the first test', () {
        late TestSession newSession;

        test(
            'then first test has modified newSession that should be reset due to default resetTestSessions.afterEach configuration',
            () async {
          newSession = await session.copyWith(
              getAuthenticationInfo: () => AuthenticationInfo(123, {}));

          expect(newSession.authenticationInfo!.userId, 123);
        });

        test(
            'then the second test has the reset newSession due to default resetTestSessions.afterEach configuration',
            () async {
          expect(newSession.authenticationInfo, isNull);
        });
      });
    },
    runMode: ServerpodRunMode.production,
  );

  withServerpod(
    'Given resetTestSessions set to afterEach',
    (endpoints, session) {
      group('when copying the session in setUpAll', () {
        late TestSession newSession;
        setUpAll(() async {
          newSession = await session.copyWith(
              getAuthenticationInfo: () => AuthenticationInfo(123, {}));
        });

        test('then the first test has the modified newSession', () async {
          expect(newSession.authenticationInfo!.userId, 123);
        });

        test('then the second test has the reset newSession', () async {
          expect(newSession.authenticationInfo, isNull);
        });
      });

      group('when copying the session in setUp', () {
        late TestSession newSession;
        setUp(() async {
          newSession = await session.copyWith(
              getAuthenticationInfo: () => AuthenticationInfo(123, {}));
        });

        test('then the first test has the modified newSession', () async {
          expect(newSession.authenticationInfo!.userId, 123);
        });

        test('then the second test has the modified newSession', () async {
          expect(newSession.authenticationInfo!.userId, 123);
        });
      });

      group('when copying the session in the first test', () {
        late TestSession newSession;

        test('then the first test has the modified newSession', () async {
          newSession = await session.copyWith(
              getAuthenticationInfo: () => AuthenticationInfo(123, {}));

          expect(newSession.authenticationInfo!.userId, 123);
        });

        test('then the second test has the reset newSession', () async {
          expect(newSession.authenticationInfo, isNull);
        });
      });
    },
    resetTestSessions: ResetTestSessions.afterEach,
    runMode: ServerpodRunMode.production,
  );

  withServerpod(
    'Given resetTestSessions set to afterAll',
    (endpoints, session) {
      group('when modifying the session in setUpAll', () {
        setUpAll(() async {
          session = await session.copyWith(
              getAuthenticationInfo: () =>
                  AuthenticationInfo(123, {Scope('user')}));
        });

        test('then the first test has the modified session', () async {
          expect(session.authenticationInfo!.userId, 123);
        });

        test('then the second test also has the modified session', () async {
          expect(session.authenticationInfo!.userId, 123);
        });
      });

      group('when copying the session in the first test', () {
        late TestSession newSession;

        test('then the first test has the modified newSession', () async {
          newSession = await session.copyWith(
              getAuthenticationInfo: () => AuthenticationInfo(123, {}));

          expect(newSession.authenticationInfo!.userId, 123);
        });

        test('then the second test has the reset newSession', () async {
          expect(newSession.authenticationInfo!.userId, 123);
        });
      });
    },
    resetTestSessions: ResetTestSessions.afterAll,
    runMode: ServerpodRunMode.production,
  );
}
