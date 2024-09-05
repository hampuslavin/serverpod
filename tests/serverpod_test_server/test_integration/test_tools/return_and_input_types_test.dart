import 'package:test/test.dart';

import 'serverpod_test_tools.dart';

void main() {
  withServerpod('Given TestToolsEndpoint', (endpoints, session) {
    test('when calling returnsString then echoes string', () async {
      final result = await endpoints.testTools.returnsString(session, "Hello");
      expect(result, 'Hello');
    });

    test('when calling returnsListOfStream then returns a stream', () async {
      final result =
          await endpoints.testTools.returnsStream(session, 3).toList();
      expect(result, [0, 1, 2]);
    });

    test(
        'when calling returnsListOfStream then returns a list of the input stream',
        () async {
      final stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);
      final result =
          await endpoints.testTools.returnsListFromInputStream(session, stream);
      expect(result, [1, 2, 3, 4, 5]);
    });

    test('when calling returnsInputStream then echoes the input stream back',
        () async {
      final stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);
      final result = await endpoints.testTools
          .returnsStreamFromInputStream(session, stream)
          .toList();
      expect(result, [1, 2, 3, 4, 5]);
    });
  });
}
