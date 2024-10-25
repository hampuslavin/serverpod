/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/src/generated/endpoints.dart';

class BoolDefaultEndpoint {
  Future<BoolDefault> create(
    _i1.Session session,
    BoolDefault boolDefault,
  ) async {
    var boolDefault = BoolDefault.db.insertRow(
      session,
      boolDefault,
    );
    return boolDefault;
  }

  Future<BoolDefault?> read(
    _i1.Session session,
    int boolDefaultId,
  ) async {
    return BoolDefault.db.findById(
      session,
      boolDefaultId,
    );
  }

  Future<BoolDefault> update(
    _i1.Session session,
    BoolDefault boolDefault,
  ) async {
    return BoolDefault.db.updateRow(
      session,
      boolDefault,
    );
  }

  Future<BoolDefault?> delete(
    _i1.Session session,
    int boolDefaultId,
  ) async {
    return (await BoolDefault.db.deleteWhere(
      session,
      where: (t) {
        return t.id.equals(boolDefaultId);
      },
    ))
        .first;
  }
}
