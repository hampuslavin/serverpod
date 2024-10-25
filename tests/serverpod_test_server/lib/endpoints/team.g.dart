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

class TeamEndpoint {
  Future<Team> create(
    _i1.Session session,
    Team team,
  ) async {
    var createdTeam = await Team.db.insertRow(
      session,
      team,
    );
    var localArena = team.arena;
    if (localArena != null) {
      var createdArena = await Arena.db.insertRow(
        session,
        localArena,
      );
    }
    var localPlayers = team.players;
    if (localPlayers != null) {}
    return team;
  }

  Future<Team?> read(
    _i1.Session session,
    int teamId,
  ) async {
    return Team.db.findById(
      session,
      teamId,
    );
  }

  Future<Team> update(
    _i1.Session session,
    Team team,
  ) async {
    return Team.db.updateRow(
      session,
      team,
    );
  }

  Future<Team?> delete(
    _i1.Session session,
    int teamId,
  ) async {
    return (await Team.db.deleteWhere(
      session,
      where: (t) {
        return t.id.equals(teamId);
      },
    ))
        .first;
  }
}
