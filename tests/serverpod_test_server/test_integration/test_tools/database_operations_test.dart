import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'serverpod_test_tools.dart';

void main() {
  withServerpod('Given TestToolsEndpoint', (endpoints, session) {
    group('when calling createSimpleData', () {
      tearDown(() async {
        await SimpleData.db
            .deleteWhere(session, where: (_) => Constant.bool(true));
      });

      test('then creates a SimpleData in the database', () async {
        await endpoints.testTools.createSimpleData(session, 123);

        final result = await SimpleData.db.find(session);
        expect(result.length, 1);
        expect(result.first.num, 123);
      });
    });

    group('when calling getAllSimpleData', () {
      setUp(() async {
        await SimpleData.db
            .insert(session, [SimpleData(num: 111), SimpleData(num: 222)]);
      });

      tearDown(() async {
        await SimpleData.db
            .deleteWhere(session, where: (_) => Constant.bool(true));
      });

      test('then returns all SimpleData in the database', () async {
        var result = await endpoints.testTools.getAllSimpleData(session);

        expect(result.length, 2);

        var nums = result.map((e) => e.num).toList();
        expect(nums, containsAll([111, 222]));
      });
    });
  });
}
