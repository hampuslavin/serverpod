import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test/src/test_database_proxy.dart';
import 'package:serverpod_test/src/transaction_manager.dart';
import 'package:serverpod_test/src/with_serverpod.dart';

/// Internal test endpoints interface that contains implementation details
/// that should only be used internally by the test tools.
abstract interface class InternalTestEndpoints {
  /// Initializes the endpoints.
  void initialize(
    SerializationManagerServer serializationManager,
    EndpointDispatch endpoints,
  );

  /// Initializes the endpoints of a module.
  void initializeModules(
    Map<String, (SerializationManagerServer, EndpointDispatch)> modules,
  );
}

/// A serverpod session used internally by the test tools.
/// This is needed to modify the transaction which is not mutable on the [Session] base class.
class InternalServerpodSession extends Session {
  /// The transaction that is used by the session.
  @override
  Transaction? get transaction {
    var localTransactionManager = transactionManager;
    if (localTransactionManager == null) {
      throw StateError(
          'Database is not enabled for this project, but transaction was accessed.');
    }
    return localTransactionManager.currentTransaction;
  }

  @override
  TestDatabaseProxy get db {
    var localDbProxy = _dbProxy;
    if (localDbProxy == null) {
      throw StateError(
          'Database is not enabled for this project, but db was accessed.');
    }
    return localDbProxy;
  }

  late final TestDatabaseProxy? _dbProxy;

  /// The database test configuration.
  final RollbackDatabase rollbackDatabase;

  /// The transaction manager to manage the Serverpod session's transactions.
  late final TransactionManager? transactionManager;

  /// Creates a new internal serverpod session.
  InternalServerpodSession({
    required super.endpoint,
    required super.method,
    required super.server,
    required super.enableLogging,
    required this.rollbackDatabase,
    required bool isDatabaseEnabled,
    TransactionManager? transactionManager,
  }) {
    if (!isDatabaseEnabled) {
      this.transactionManager = null;
      _dbProxy = null;
      return;
    }

    var localTransactionManager =
        transactionManager ?? TransactionManager(this);
    _dbProxy = TestDatabaseProxy(
      super.db,
      rollbackDatabase,
      localTransactionManager,
    );

    this.transactionManager = localTransactionManager;
  }
}

List<String> _getServerpodStartUpArgs(String? runMode, bool? applyMigrations) =>
    [
      '-m',
      runMode ?? ServerpodRunMode.test,
      if (applyMigrations ?? true) '--apply-migrations',
    ];

/// A pair of an endpoint dispatch and the test endpoints that are exposed to the user.
class TestEndpointPair<T> {
  /// The endpoint dispatch that is used to dispatch the endpoints.
  final EndpointDispatch endpointDispatch;

  /// The test endpoints that are exposed to the user.
  final T testEndpoints;

  /// Module name

  /// Creates a new [TestEndpointPair].
  TestEndpointPair(
    this.endpointDispatch,
    this.testEndpoints,
  );
}

/// A pair of an endpoint dispatch and the test endpoints that are exposed to the user.
class TestModuleEndpointPair<T> extends TestEndpointPair<T> {
  /// The module name
  final String moduleName;

  /// Creates a new [TestModuleEndpointPair].
  TestModuleEndpointPair(
    super.endpointDispatch,
    super.testEndpoints,
    this.moduleName,
  );
}

/// A facade for the real Serverpod instance.
class TestServerpod<T extends InternalTestEndpoints> {
  /// The test endpoints that are exposed to the user.
  T testEndpoints;

  final Serverpod _serverpod;

  /// Whether the database is enabled and supported by the project configuration.
  final bool isDatabaseEnabled;

  /// Creates a new test serverpod instance.
  TestServerpod({
    bool? applyMigrations,
    required TestEndpointPair serverEndpoints,
    required List<TestModuleEndpointPair> moduleEndpoints,
    required SerializationManagerServer serializationManager,
    required this.isDatabaseEnabled,
    String? runMode,
  })  : _serverpod = Serverpod(
          _getServerpodStartUpArgs(
            runMode,
            applyMigrations,
          ),
          serializationManager,
          serverEndpoints.endpointDispatch,
        ),
        testEndpoints = serverEndpoints.testEndpoints {
    serverEndpoints.endpointDispatch.initializeEndpoints(_serverpod.server);
    testEndpoints.initialize(
        serializationManager, serverEndpoints.endpointDispatch);

    testEndpoints.initializeModules(moduleEndpoints
        .fold<Map<String, (SerializationManagerServer, EndpointDispatch)>>({},
            (previousValue, element) {
      element.endpointDispatch.initializeEndpoints(_serverpod.server);

      return {
        ...previousValue,
        element.moduleName: (serializationManager, element.endpointDispatch),
      };
    }));
  }

  /// Starts the underlying serverpod instance.
  Future<void> start() async {
    try {
      await _serverpod.start(runInGuardedZone: false);
    } on ExitException catch (e) {
      throw InitializationException(
        'Failed to start the serverpod instance${e.message.isEmpty ? ', check the log for more info.' : ': ${e.message}'}',
      );
    } catch (_) {
      throw InitializationException(
        'Failed to start the serverpod instance, check the log for more info.',
      );
    }
  }

  /// Shuts down the underlying serverpod instance.
  Future<void> shutdown() async {
    return _serverpod.shutdown(exitProcess: false);
  }

  /// Creates a new Serverpod session.
  InternalServerpodSession createSession({
    bool enableLogging = false,
    required RollbackDatabase rollbackDatabase,
    String endpoint = '',
    String method = '',
    TransactionManager? transactionManager,
  }) {
    return InternalServerpodSession(
      server: _serverpod.server,
      enableLogging: enableLogging,
      endpoint: endpoint,
      method: method,
      rollbackDatabase: rollbackDatabase,
      transactionManager: transactionManager,
      isDatabaseEnabled: isDatabaseEnabled,
    );
  }
}
