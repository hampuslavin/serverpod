import 'package:test/test.dart';

import '../test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('ExampleEndpoint', (endpoints, session) {
    test('hello', () async {
      final result = await endpoints.example.hello(session, "Annie");
      expect(result, 'Hello Annie');
    });
  });
}
