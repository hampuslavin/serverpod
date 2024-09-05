import 'package:serverpod/src/database/database.dart';

/// Interface for accessing the database.
abstract interface class DatabaseAccessor {
  /// The database to access.
  Database get db;
}
