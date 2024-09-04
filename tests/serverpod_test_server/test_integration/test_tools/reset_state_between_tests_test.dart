import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'serverpod_test_tools.dart';

void main() {
  withServerpod(
      'Given resetStateBetweenTests set to true when modifying the session then it does not persist between tests',
      (endpoints, session) {
    setUpAll(() async {
      session = await session.copyWith(
          getAuthenticationInfo: () =>
              AuthenticationInfo(123, {Scope('user')}));
    });
    test('first test', () async {
      expect(session.authenticationInfo!.userId, 123);
    });

    test('second test', () async {
      expect(session.authenticationInfo, isNull);
    });
  }, resetStateBetweenTests: true);

  withServerpod(
      'Given resetStateBetweenTests set to false when modifying the session then it persists between tests',
      (endpoints, session) {
    setUpAll(() async {
      session = await session.copyWith(
          getAuthenticationInfo: () =>
              AuthenticationInfo(123, {Scope('user')}));
    });
    test('first test', () async {
      expect(session.authenticationInfo!.userId, 123);
    });

    test('second test', () async {
      expect(session.authenticationInfo!.userId, 123);
    });
  }, resetStateBetweenTests: false);
}
