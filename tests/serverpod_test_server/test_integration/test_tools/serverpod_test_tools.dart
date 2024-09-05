/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_test/serverpod_test.dart' as _i1;
import 'package:serverpod/serverpod.dart' as _i2;
import 'dart:async' as _i3;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i4;
import 'dart:typed_data' as _i5;
import 'package:uuid/uuid_value.dart' as _i6;
import 'package:serverpod_test_server/src/protocol_custom_classes.dart' as _i7;
import 'package:serverpod_test_server/src/custom_classes.dart' as _i8;
import 'package:serverpod_test_client/src/custom_classes.dart' as _i9;
import 'package:serverpod_test_shared/src/external_custom_class.dart' as _i10;
import 'package:serverpod_test_shared/src/freezed_custom_class.dart' as _i11;
import 'package:serverpod_test_server/src/generated/simple_data.dart' as _i12;
import 'package:serverpod_test_server/src/generated/simple_data_list.dart'
    as _i13;
import 'package:serverpod_test_client/src/protocol/simple_data.dart' as _i14;
import 'package:serverpod_test_server/src/generated/types.dart' as _i15;
import 'package:serverpod_test_client/src/protocol/types.dart' as _i16;
import 'package:serverpod_test_server/src/generated/object_with_enum.dart'
    as _i17;
import 'package:serverpod_test_client/src/protocol/object_with_enum.dart'
    as _i18;
import 'package:serverpod_test_server/src/generated/object_with_object.dart'
    as _i19;
import 'package:serverpod_test_client/src/protocol/object_with_object.dart'
    as _i20;
import 'package:serverpod_test_client/src/protocol/object_field_scopes.dart'
    as _i21;
import 'package:serverpod_test_server/src/generated/object_field_scopes.dart'
    as _i22;
import 'package:serverpod_test_server/src/generated/test_enum.dart' as _i23;
import 'package:serverpod_test_client/src/protocol/test_enum.dart' as _i24;
import 'package:serverpod_test_module_server/serverpod_test_module_server.dart'
    as _i25;
import 'package:serverpod_test_module_client/serverpod_test_module_client.dart'
    as _i26;
import 'package:serverpod_test_server/src/generated/module_datatype.dart'
    as _i27;
import 'package:serverpod_test_server/src/generated/scopes/scope_server_only_field.dart'
    as _i28;
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/src/generated/endpoints.dart';
export 'package:serverpod_test/serverpod_test.dart'
    show
        TestSession,
        UnauthenticatedEndpointCallTestException,
        InsufficientEndpointAccessTestException;

@_i1.isTestGroup
withServerpod(
  String testGroupName,
  _i1.TestClosure<TestEndpoints> testClosure, {
  bool? resetStateBetweenTests,
}) {
  _i1.buildWithServerpod<TestEndpoints>(
    _i1.TestServerpod(
      testEndpoints: TestEndpoints(),
      endpoints: Endpoints(),
      serializationManager: Protocol(),
    ),
    resetStateBetweenTests: resetStateBetweenTests,
  )(
    testGroupName,
    testClosure,
  );
}

class TestEndpoints extends _i1.TestEndpointsBase {
  late final AsyncTasksEndpoint asyncTasks;

  late final AuthenticationEndpoint authentication;

  late final BasicTypesEndpoint basicTypes;

  late final CloudStorageEndpoint cloudStorage;

  late final S3CloudStorageEndpoint s3CloudStorage;

  late final CustomClassProtocolEndpoint customClassProtocol;

  late final CustomTypesEndpoint customTypes;

  late final BasicDatabase basicDatabase;

  late final TransactionsDatabaseEndpoint transactionsDatabase;

  late final DeprecationEndpoint deprecation;

  late final EmailAuthTestMethods emailAuthTestMethods;

  late final ExceptionTestEndpoint exceptionTest;

  late final FailedCallsEndpoint failedCalls;

  late final FieldScopesEndpoint fieldScopes;

  late final FutureCallsEndpoint futureCalls;

  late final ListParametersEndpoint listParameters;

  late final LoggingEndpoint logging;

  late final StreamLogging streamLogging;

  late final StreamQueryLogging streamQueryLogging;

  late final LoggingDisabledEndpoint loggingDisabled;

  late final MapParametersEndpoint mapParameters;

  late final MethodStreaming methodStreaming;

  late final AuthenticatedMethodStreaming authenticatedMethodStreaming;

  late final ModuleSerializationEndpoint moduleSerialization;

  late final NamedParametersEndpoint namedParameters;

  late final OptionalParametersEndpoint optionalParameters;

  late final RedisEndpoint redis;

  late final ServerOnlyScopedFieldModelEndpoint serverOnlyScopedFieldModel;

  late final SignInRequiredEndpoint signInRequired;

  late final AdminScopeRequiredEndpoint adminScopeRequired;

  late final SimpleEndpoint simple;

  late final StreamingEndpoint streaming;

  late final StreamingLoggingEndpoint streamingLogging;

  late final SubSubDirTestEndpoint subSubDirTest;

  late final SubDirTestEndpoint subDirTest;

  late final TestToolsEndpoint testTools;

  late final AuthenticatedTestToolsEndpoint authenticatedTestTools;

  @override
  initialize(
    _i2.SerializationManager serializationManager,
    _i2.EndpointDispatch endpoints,
  ) {
    asyncTasks = AsyncTasksEndpoint(
      endpoints,
      serializationManager,
    );
    authentication = AuthenticationEndpoint(
      endpoints,
      serializationManager,
    );
    basicTypes = BasicTypesEndpoint(
      endpoints,
      serializationManager,
    );
    cloudStorage = CloudStorageEndpoint(
      endpoints,
      serializationManager,
    );
    s3CloudStorage = S3CloudStorageEndpoint(
      endpoints,
      serializationManager,
    );
    customClassProtocol = CustomClassProtocolEndpoint(
      endpoints,
      serializationManager,
    );
    customTypes = CustomTypesEndpoint(
      endpoints,
      serializationManager,
    );
    basicDatabase = BasicDatabase(
      endpoints,
      serializationManager,
    );
    transactionsDatabase = TransactionsDatabaseEndpoint(
      endpoints,
      serializationManager,
    );
    deprecation = DeprecationEndpoint(
      endpoints,
      serializationManager,
    );
    emailAuthTestMethods = EmailAuthTestMethods(
      endpoints,
      serializationManager,
    );
    exceptionTest = ExceptionTestEndpoint(
      endpoints,
      serializationManager,
    );
    failedCalls = FailedCallsEndpoint(
      endpoints,
      serializationManager,
    );
    fieldScopes = FieldScopesEndpoint(
      endpoints,
      serializationManager,
    );
    futureCalls = FutureCallsEndpoint(
      endpoints,
      serializationManager,
    );
    listParameters = ListParametersEndpoint(
      endpoints,
      serializationManager,
    );
    logging = LoggingEndpoint(
      endpoints,
      serializationManager,
    );
    streamLogging = StreamLogging(
      endpoints,
      serializationManager,
    );
    streamQueryLogging = StreamQueryLogging(
      endpoints,
      serializationManager,
    );
    loggingDisabled = LoggingDisabledEndpoint(
      endpoints,
      serializationManager,
    );
    mapParameters = MapParametersEndpoint(
      endpoints,
      serializationManager,
    );
    methodStreaming = MethodStreaming(
      endpoints,
      serializationManager,
    );
    authenticatedMethodStreaming = AuthenticatedMethodStreaming(
      endpoints,
      serializationManager,
    );
    moduleSerialization = ModuleSerializationEndpoint(
      endpoints,
      serializationManager,
    );
    namedParameters = NamedParametersEndpoint(
      endpoints,
      serializationManager,
    );
    optionalParameters = OptionalParametersEndpoint(
      endpoints,
      serializationManager,
    );
    redis = RedisEndpoint(
      endpoints,
      serializationManager,
    );
    serverOnlyScopedFieldModel = ServerOnlyScopedFieldModelEndpoint(
      endpoints,
      serializationManager,
    );
    signInRequired = SignInRequiredEndpoint(
      endpoints,
      serializationManager,
    );
    adminScopeRequired = AdminScopeRequiredEndpoint(
      endpoints,
      serializationManager,
    );
    simple = SimpleEndpoint(
      endpoints,
      serializationManager,
    );
    streaming = StreamingEndpoint(
      endpoints,
      serializationManager,
    );
    streamingLogging = StreamingLoggingEndpoint(
      endpoints,
      serializationManager,
    );
    subSubDirTest = SubSubDirTestEndpoint(
      endpoints,
      serializationManager,
    );
    subDirTest = SubDirTestEndpoint(
      endpoints,
      serializationManager,
    );
    testTools = TestToolsEndpoint(
      endpoints,
      serializationManager,
    );
    authenticatedTestTools = AuthenticatedTestToolsEndpoint(
      endpoints,
      serializationManager,
    );
  }
}

class AsyncTasksEndpoint {
  AsyncTasksEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> insertRowToSimpleDataAfterDelay(
    _i1.TestSession session,
    int num,
    int seconds,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'asyncTasks',
        methodName: 'insertRowToSimpleDataAfterDelay',
        parameters: {
          'num': num,
          'seconds': seconds,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> throwExceptionAfterDelay(
    _i1.TestSession session,
    int seconds,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'asyncTasks',
        methodName: 'throwExceptionAfterDelay',
        parameters: {'seconds': seconds},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }
}

class AuthenticationEndpoint {
  AuthenticationEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> removeAllUsers(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'authentication',
        methodName: 'removeAllUsers',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<int> countUsers(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'authentication',
        methodName: 'countUsers',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<int>);
    });
  }

  _i3.Future<void> createUser(
    _i1.TestSession session,
    String email,
    String password,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'authentication',
        methodName: 'createUser',
        parameters: {
          'email': email,
          'password': password,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<_i4.AuthenticationResponse> authenticate(
    _i1.TestSession session,
    String email,
    String password,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'authentication',
        methodName: 'authenticate',
        parameters: {
          'email': email,
          'password': password,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i4.AuthenticationResponse>);
    });
  }

  _i3.Future<void> signOut(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'authentication',
        methodName: 'signOut',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> updateScopes(
    _i1.TestSession session,
    int userId,
    List<String> scopes,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'authentication',
        methodName: 'updateScopes',
        parameters: {
          'userId': userId,
          'scopes': scopes,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }
}

class BasicTypesEndpoint {
  BasicTypesEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<int?> testInt(
    _i1.TestSession session,
    int? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicTypes',
        methodName: 'testInt',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<int?>);
    });
  }

  _i3.Future<double?> testDouble(
    _i1.TestSession session,
    double? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicTypes',
        methodName: 'testDouble',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<double?>);
    });
  }

  _i3.Future<bool?> testBool(
    _i1.TestSession session,
    bool? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicTypes',
        methodName: 'testBool',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool?>);
    });
  }

  _i3.Future<DateTime?> testDateTime(
    _i1.TestSession session,
    DateTime? dateTime,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicTypes',
        methodName: 'testDateTime',
        parameters: {'dateTime': dateTime},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<DateTime?>);
    });
  }

  _i3.Future<String?> testString(
    _i1.TestSession session,
    String? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicTypes',
        methodName: 'testString',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String?>);
    });
  }

  _i3.Future<_i5.ByteData?> testByteData(
    _i1.TestSession session,
    _i5.ByteData? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicTypes',
        methodName: 'testByteData',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i5.ByteData?>);
    });
  }

  _i3.Future<Duration?> testDuration(
    _i1.TestSession session,
    Duration? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicTypes',
        methodName: 'testDuration',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Duration?>);
    });
  }

  _i3.Future<_i6.UuidValue?> testUuid(
    _i1.TestSession session,
    _i6.UuidValue? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicTypes',
        methodName: 'testUuid',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i6.UuidValue?>);
    });
  }
}

class CloudStorageEndpoint {
  CloudStorageEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> reset(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'cloudStorage',
        methodName: 'reset',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> storePublicFile(
    _i1.TestSession session,
    String path,
    _i5.ByteData byteData,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'cloudStorage',
        methodName: 'storePublicFile',
        parameters: {
          'path': path,
          'byteData': byteData,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<_i5.ByteData?> retrievePublicFile(
    _i1.TestSession session,
    String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'cloudStorage',
        methodName: 'retrievePublicFile',
        parameters: {'path': path},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i5.ByteData?>);
    });
  }

  _i3.Future<bool?> existsPublicFile(
    _i1.TestSession session,
    String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'cloudStorage',
        methodName: 'existsPublicFile',
        parameters: {'path': path},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool?>);
    });
  }

  _i3.Future<void> deletePublicFile(
    _i1.TestSession session,
    String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'cloudStorage',
        methodName: 'deletePublicFile',
        parameters: {'path': path},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<String?> getPublicUrlForFile(
    _i1.TestSession session,
    String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'cloudStorage',
        methodName: 'getPublicUrlForFile',
        parameters: {'path': path},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String?>);
    });
  }

  _i3.Future<String?> getDirectFilePostUrl(
    _i1.TestSession session,
    String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'cloudStorage',
        methodName: 'getDirectFilePostUrl',
        parameters: {'path': path},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String?>);
    });
  }

  _i3.Future<bool> verifyDirectFileUpload(
    _i1.TestSession session,
    String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'cloudStorage',
        methodName: 'verifyDirectFileUpload',
        parameters: {'path': path},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool>);
    });
  }
}

class S3CloudStorageEndpoint {
  S3CloudStorageEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> storePublicFile(
    _i1.TestSession session,
    String path,
    _i5.ByteData byteData,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 's3CloudStorage',
        methodName: 'storePublicFile',
        parameters: {
          'path': path,
          'byteData': byteData,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<_i5.ByteData?> retrievePublicFile(
    _i1.TestSession session,
    String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 's3CloudStorage',
        methodName: 'retrievePublicFile',
        parameters: {'path': path},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i5.ByteData?>);
    });
  }

  _i3.Future<bool?> existsPublicFile(
    _i1.TestSession session,
    String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 's3CloudStorage',
        methodName: 'existsPublicFile',
        parameters: {'path': path},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool?>);
    });
  }

  _i3.Future<void> deletePublicFile(
    _i1.TestSession session,
    String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 's3CloudStorage',
        methodName: 'deletePublicFile',
        parameters: {'path': path},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<String?> getPublicUrlForFile(
    _i1.TestSession session,
    String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 's3CloudStorage',
        methodName: 'getPublicUrlForFile',
        parameters: {'path': path},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String?>);
    });
  }

  _i3.Future<String?> getDirectFilePostUrl(
    _i1.TestSession session,
    String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 's3CloudStorage',
        methodName: 'getDirectFilePostUrl',
        parameters: {'path': path},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String?>);
    });
  }

  _i3.Future<bool> verifyDirectFileUpload(
    _i1.TestSession session,
    String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 's3CloudStorage',
        methodName: 'verifyDirectFileUpload',
        parameters: {'path': path},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool>);
    });
  }
}

class CustomClassProtocolEndpoint {
  CustomClassProtocolEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i7.ProtocolCustomClass> getProtocolField(
      _i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'customClassProtocol',
        methodName: 'getProtocolField',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i7.ProtocolCustomClass>);
    });
  }
}

class CustomTypesEndpoint {
  CustomTypesEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i8.CustomClass> returnCustomClass(
    _i1.TestSession session,
    _i9.CustomClass data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'customTypes',
        methodName: 'returnCustomClass',
        parameters: {'data': data},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i8.CustomClass>);
    });
  }

  _i3.Future<_i8.CustomClass?> returnCustomClassNullable(
    _i1.TestSession session,
    _i9.CustomClass? data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'customTypes',
        methodName: 'returnCustomClassNullable',
        parameters: {'data': data},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i8.CustomClass?>);
    });
  }

  _i3.Future<_i8.CustomClass2> returnCustomClass2(
    _i1.TestSession session,
    _i9.CustomClass2 data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'customTypes',
        methodName: 'returnCustomClass2',
        parameters: {'data': data},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i8.CustomClass2>);
    });
  }

  _i3.Future<_i8.CustomClass2?> returnCustomClass2Nullable(
    _i1.TestSession session,
    _i9.CustomClass2? data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'customTypes',
        methodName: 'returnCustomClass2Nullable',
        parameters: {'data': data},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i8.CustomClass2?>);
    });
  }

  _i3.Future<_i10.ExternalCustomClass> returnExternalCustomClass(
    _i1.TestSession session,
    _i10.ExternalCustomClass data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'customTypes',
        methodName: 'returnExternalCustomClass',
        parameters: {'data': data},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i10.ExternalCustomClass>);
    });
  }

  _i3.Future<_i10.ExternalCustomClass?> returnExternalCustomClassNullable(
    _i1.TestSession session,
    _i10.ExternalCustomClass? data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'customTypes',
        methodName: 'returnExternalCustomClassNullable',
        parameters: {'data': data},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i10.ExternalCustomClass?>);
    });
  }

  _i3.Future<_i11.FreezedCustomClass> returnFreezedCustomClass(
    _i1.TestSession session,
    _i11.FreezedCustomClass data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'customTypes',
        methodName: 'returnFreezedCustomClass',
        parameters: {'data': data},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i11.FreezedCustomClass>);
    });
  }

  _i3.Future<_i11.FreezedCustomClass?> returnFreezedCustomClassNullable(
    _i1.TestSession session,
    _i11.FreezedCustomClass? data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'customTypes',
        methodName: 'returnFreezedCustomClassNullable',
        parameters: {'data': data},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i11.FreezedCustomClass?>);
    });
  }
}

class BasicDatabase {
  BasicDatabase(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> deleteAllSimpleTestData(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'deleteAllSimpleTestData',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> deleteSimpleTestDataLessThan(
    _i1.TestSession session,
    int num,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'deleteSimpleTestDataLessThan',
        parameters: {'num': num},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> findAndDeleteSimpleTestData(
    _i1.TestSession session,
    int num,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'findAndDeleteSimpleTestData',
        parameters: {'num': num},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> createSimpleTestData(
    _i1.TestSession session,
    int numRows,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'createSimpleTestData',
        parameters: {'numRows': numRows},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<List<_i12.SimpleData>> findSimpleData(
      _i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'findSimpleData',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<_i12.SimpleData>>);
    });
  }

  _i3.Future<_i12.SimpleData?> findFirstRowSimpleData(
    _i1.TestSession session,
    int num,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'findFirstRowSimpleData',
        parameters: {'num': num},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i12.SimpleData?>);
    });
  }

  _i3.Future<_i12.SimpleData?> findByIdSimpleData(
    _i1.TestSession session,
    int id,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'findByIdSimpleData',
        parameters: {'id': id},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i12.SimpleData?>);
    });
  }

  _i3.Future<_i13.SimpleDataList?> findSimpleDataRowsLessThan(
    _i1.TestSession session,
    int num,
    int offset,
    int limit,
    bool descending,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'findSimpleDataRowsLessThan',
        parameters: {
          'num': num,
          'offset': offset,
          'limit': limit,
          'descending': descending,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i13.SimpleDataList?>);
    });
  }

  _i3.Future<_i12.SimpleData> insertRowSimpleData(
    _i1.TestSession session,
    _i14.SimpleData simpleData,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'insertRowSimpleData',
        parameters: {'simpleData': simpleData},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i12.SimpleData>);
    });
  }

  _i3.Future<_i12.SimpleData> updateRowSimpleData(
    _i1.TestSession session,
    _i14.SimpleData simpleData,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'updateRowSimpleData',
        parameters: {'simpleData': simpleData},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i12.SimpleData>);
    });
  }

  _i3.Future<int> deleteRowSimpleData(
    _i1.TestSession session,
    _i14.SimpleData simpleData,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'deleteRowSimpleData',
        parameters: {'simpleData': simpleData},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<int>);
    });
  }

  _i3.Future<List<int>> deleteWhereSimpleData(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'deleteWhereSimpleData',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<int>>);
    });
  }

  _i3.Future<int> countSimpleData(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'countSimpleData',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<int>);
    });
  }

  _i3.Future<_i15.Types> insertTypes(
    _i1.TestSession session,
    _i16.Types value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'insertTypes',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i15.Types>);
    });
  }

  _i3.Future<_i15.Types> updateTypes(
    _i1.TestSession session,
    _i16.Types value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'updateTypes',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i15.Types>);
    });
  }

  _i3.Future<int?> countTypesRows(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'countTypesRows',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<int?>);
    });
  }

  _i3.Future<List<int>> deleteAllInTypes(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'deleteAllInTypes',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<int>>);
    });
  }

  _i3.Future<_i15.Types?> getTypes(
    _i1.TestSession session,
    int id,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'getTypes',
        parameters: {'id': id},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i15.Types?>);
    });
  }

  _i3.Future<int?> getTypesRawQuery(
    _i1.TestSession session,
    int id,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'getTypesRawQuery',
        parameters: {'id': id},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<int?>);
    });
  }

  _i3.Future<_i17.ObjectWithEnum> storeObjectWithEnum(
    _i1.TestSession session,
    _i18.ObjectWithEnum object,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'storeObjectWithEnum',
        parameters: {'object': object},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i17.ObjectWithEnum>);
    });
  }

  _i3.Future<_i17.ObjectWithEnum?> getObjectWithEnum(
    _i1.TestSession session,
    int id,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'getObjectWithEnum',
        parameters: {'id': id},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i17.ObjectWithEnum?>);
    });
  }

  _i3.Future<_i19.ObjectWithObject> storeObjectWithObject(
    _i1.TestSession session,
    _i20.ObjectWithObject object,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'storeObjectWithObject',
        parameters: {'object': object},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i19.ObjectWithObject>);
    });
  }

  _i3.Future<_i19.ObjectWithObject?> getObjectWithObject(
    _i1.TestSession session,
    int id,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'getObjectWithObject',
        parameters: {'id': id},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i19.ObjectWithObject?>);
    });
  }

  _i3.Future<int> deleteAll(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'deleteAll',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<int>);
    });
  }

  _i3.Future<bool> testByteDataStore(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'basicDatabase',
        methodName: 'testByteDataStore',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool>);
    });
  }
}

class TransactionsDatabaseEndpoint {
  TransactionsDatabaseEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> removeRow(
    _i1.TestSession session,
    int num,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'transactionsDatabase',
        methodName: 'removeRow',
        parameters: {'num': num},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<bool> updateInsertDelete(
    _i1.TestSession session,
    int numUpdate,
    int numInsert,
    int numDelete,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'transactionsDatabase',
        methodName: 'updateInsertDelete',
        parameters: {
          'numUpdate': numUpdate,
          'numInsert': numInsert,
          'numDelete': numDelete,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool>);
    });
  }
}

class DeprecationEndpoint {
  DeprecationEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> setGlobalDouble(
    _i1.TestSession session,
    double? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'deprecation',
        methodName: 'setGlobalDouble',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<double> getGlobalDouble(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'deprecation',
        methodName: 'getGlobalDouble',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<double>);
    });
  }
}

class EmailAuthTestMethods {
  EmailAuthTestMethods(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String?> findVerificationCode(
    _i1.TestSession session,
    String userName,
    String email,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'emailAuthTestMethods',
        methodName: 'findVerificationCode',
        parameters: {
          'userName': userName,
          'email': email,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String?>);
    });
  }

  _i3.Future<String?> findResetCode(
    _i1.TestSession session,
    String email,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'emailAuthTestMethods',
        methodName: 'findResetCode',
        parameters: {'email': email},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String?>);
    });
  }

  _i3.Future<void> tearDown(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'emailAuthTestMethods',
        methodName: 'tearDown',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<bool> createUser(
    _i1.TestSession session,
    String userName,
    String email,
    String password,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'emailAuthTestMethods',
        methodName: 'createUser',
        parameters: {
          'userName': userName,
          'email': email,
          'password': password,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool>);
    });
  }
}

class ExceptionTestEndpoint {
  ExceptionTestEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> throwNormalException(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'exceptionTest',
        methodName: 'throwNormalException',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String>);
    });
  }

  _i3.Future<String> throwExceptionWithData(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'exceptionTest',
        methodName: 'throwExceptionWithData',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String>);
    });
  }

  _i3.Future<String> workingWithoutException(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'exceptionTest',
        methodName: 'workingWithoutException',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String>);
    });
  }
}

class FailedCallsEndpoint {
  FailedCallsEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> failedCall(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'failedCalls',
        methodName: 'failedCall',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> failedDatabaseQuery(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'failedCalls',
        methodName: 'failedDatabaseQuery',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<bool> failedDatabaseQueryCaughtException(
      _i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'failedCalls',
        methodName: 'failedDatabaseQueryCaughtException',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool>);
    });
  }

  _i3.Future<void> slowCall(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'failedCalls',
        methodName: 'slowCall',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> caughtException(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'failedCalls',
        methodName: 'caughtException',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }
}

class FieldScopesEndpoint {
  FieldScopesEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> storeObject(
    _i1.TestSession session,
    _i21.ObjectFieldScopes object,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'fieldScopes',
        methodName: 'storeObject',
        parameters: {'object': object},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<_i22.ObjectFieldScopes?> retrieveObject(
      _i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'fieldScopes',
        methodName: 'retrieveObject',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i22.ObjectFieldScopes?>);
    });
  }
}

class FutureCallsEndpoint {
  FutureCallsEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> makeFutureCall(
    _i1.TestSession session,
    _i14.SimpleData? data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'futureCalls',
        methodName: 'makeFutureCall',
        parameters: {'data': data},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }
}

class ListParametersEndpoint {
  ListParametersEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<List<int>> returnIntList(
    _i1.TestSession session,
    List<int> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnIntList',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<int>>);
    });
  }

  _i3.Future<List<List<int>>> returnIntListList(
    _i1.TestSession session,
    List<List<int>> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnIntListList',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<List<int>>>);
    });
  }

  _i3.Future<List<int>?> returnIntListNullable(
    _i1.TestSession session,
    List<int>? list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnIntListNullable',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<int>?>);
    });
  }

  _i3.Future<List<List<int>?>> returnIntListNullableList(
    _i1.TestSession session,
    List<List<int>?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnIntListNullableList',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<List<int>?>>);
    });
  }

  _i3.Future<List<List<int>>?> returnIntListListNullable(
    _i1.TestSession session,
    List<List<int>>? list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnIntListListNullable',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<List<int>>?>);
    });
  }

  _i3.Future<List<int?>> returnIntListNullableInts(
    _i1.TestSession session,
    List<int?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnIntListNullableInts',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<int?>>);
    });
  }

  _i3.Future<List<int?>?> returnNullableIntListNullableInts(
    _i1.TestSession session,
    List<int?>? list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnNullableIntListNullableInts',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<int?>?>);
    });
  }

  _i3.Future<List<double>> returnDoubleList(
    _i1.TestSession session,
    List<double> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnDoubleList',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<double>>);
    });
  }

  _i3.Future<List<double?>> returnDoubleListNullableDoubles(
    _i1.TestSession session,
    List<double?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnDoubleListNullableDoubles',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<double?>>);
    });
  }

  _i3.Future<List<bool>> returnBoolList(
    _i1.TestSession session,
    List<bool> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnBoolList',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<bool>>);
    });
  }

  _i3.Future<List<bool?>> returnBoolListNullableBools(
    _i1.TestSession session,
    List<bool?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnBoolListNullableBools',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<bool?>>);
    });
  }

  _i3.Future<List<String>> returnStringList(
    _i1.TestSession session,
    List<String> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnStringList',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<String>>);
    });
  }

  _i3.Future<List<String?>> returnStringListNullableStrings(
    _i1.TestSession session,
    List<String?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnStringListNullableStrings',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<String?>>);
    });
  }

  _i3.Future<List<DateTime>> returnDateTimeList(
    _i1.TestSession session,
    List<DateTime> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnDateTimeList',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<DateTime>>);
    });
  }

  _i3.Future<List<DateTime?>> returnDateTimeListNullableDateTimes(
    _i1.TestSession session,
    List<DateTime?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnDateTimeListNullableDateTimes',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<DateTime?>>);
    });
  }

  _i3.Future<List<_i5.ByteData>> returnByteDataList(
    _i1.TestSession session,
    List<_i5.ByteData> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnByteDataList',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<_i5.ByteData>>);
    });
  }

  _i3.Future<List<_i5.ByteData?>> returnByteDataListNullableByteDatas(
    _i1.TestSession session,
    List<_i5.ByteData?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnByteDataListNullableByteDatas',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<_i5.ByteData?>>);
    });
  }

  _i3.Future<List<_i12.SimpleData>> returnSimpleDataList(
    _i1.TestSession session,
    List<_i14.SimpleData> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnSimpleDataList',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<_i12.SimpleData>>);
    });
  }

  _i3.Future<List<_i12.SimpleData?>> returnSimpleDataListNullableSimpleData(
    _i1.TestSession session,
    List<_i14.SimpleData?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnSimpleDataListNullableSimpleData',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<_i12.SimpleData?>>);
    });
  }

  _i3.Future<List<_i12.SimpleData>?> returnSimpleDataListNullable(
    _i1.TestSession session,
    List<_i14.SimpleData>? list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnSimpleDataListNullable',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<_i12.SimpleData>?>);
    });
  }

  _i3.Future<List<_i12.SimpleData?>?>
      returnNullableSimpleDataListNullableSimpleData(
    _i1.TestSession session,
    List<_i14.SimpleData?>? list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnNullableSimpleDataListNullableSimpleData',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<_i12.SimpleData?>?>);
    });
  }

  _i3.Future<List<Duration>> returnDurationList(
    _i1.TestSession session,
    List<Duration> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnDurationList',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<Duration>>);
    });
  }

  _i3.Future<List<Duration?>> returnDurationListNullableDurations(
    _i1.TestSession session,
    List<Duration?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'listParameters',
        methodName: 'returnDurationListNullableDurations',
        parameters: {'list': list},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<Duration?>>);
    });
  }
}

class LoggingEndpoint {
  LoggingEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> slowQueryMethod(
    _i1.TestSession session,
    int seconds,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'slowQueryMethod',
        parameters: {'seconds': seconds},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> queryMethod(
    _i1.TestSession session,
    int queries,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'queryMethod',
        parameters: {'queries': queries},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> failedQueryMethod(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'failedQueryMethod',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> slowMethod(
    _i1.TestSession session,
    int delayMillis,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'slowMethod',
        parameters: {'delayMillis': delayMillis},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> failingMethod(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'failingMethod',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> emptyMethod(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'emptyMethod',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> log(
    _i1.TestSession session,
    String message,
    List<int> logLevels,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'log',
        parameters: {
          'message': message,
          'logLevels': logLevels,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> logInfo(
    _i1.TestSession session,
    String message,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'logInfo',
        parameters: {'message': message},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> logDebugAndInfoAndError(
    _i1.TestSession session,
    String debug,
    String info,
    String error,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'logDebugAndInfoAndError',
        parameters: {
          'debug': debug,
          'info': info,
          'error': error,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> twoQueries(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'twoQueries',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Stream<int> streamEmpty(
    _i1.TestSession session,
    _i3.Stream<int> input,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'streamEmpty',
        arguments: {},
        requestedInputStreams: ['input'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'input': input},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Stream<int> streamLogging(
    _i1.TestSession session,
    _i3.Stream<int> input,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'streamLogging',
        arguments: {},
        requestedInputStreams: ['input'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'input': input},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Stream<int> streamQueryLogging(
    _i1.TestSession session,
    _i3.Stream<int> input,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'logging',
        methodName: 'streamQueryLogging',
        arguments: {},
        requestedInputStreams: ['input'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'input': input},
      ) as _i3.Stream<int>);
    });
  }
}

class StreamLogging {
  StreamLogging(
    _endpointDispatch,
    _serializationManager,
  );
}

class StreamQueryLogging {
  StreamQueryLogging(
    _endpointDispatch,
    _serializationManager,
  );
}

class LoggingDisabledEndpoint {
  LoggingDisabledEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> logInfo(
    _i1.TestSession session,
    String message,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'loggingDisabled',
        methodName: 'logInfo',
        parameters: {'message': message},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }
}

class MapParametersEndpoint {
  MapParametersEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<Map<String, int>> returnIntMap(
    _i1.TestSession session,
    Map<String, int> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnIntMap',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, int>>);
    });
  }

  _i3.Future<Map<String, int>?> returnIntMapNullable(
    _i1.TestSession session,
    Map<String, int>? map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnIntMapNullable',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, int>?>);
    });
  }

  _i3.Future<Map<String, Map<String, int>>> returnNestedIntMap(
    _i1.TestSession session,
    Map<String, Map<String, int>> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnNestedIntMap',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, Map<String, int>>>);
    });
  }

  _i3.Future<Map<String, int?>> returnIntMapNullableInts(
    _i1.TestSession session,
    Map<String, int?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnIntMapNullableInts',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, int?>>);
    });
  }

  _i3.Future<Map<String, int?>?> returnNullableIntMapNullableInts(
    _i1.TestSession session,
    Map<String, int?>? map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnNullableIntMapNullableInts',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, int?>?>);
    });
  }

  _i3.Future<Map<int, int>> returnIntIntMap(
    _i1.TestSession session,
    Map<int, int> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnIntIntMap',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<int, int>>);
    });
  }

  _i3.Future<Map<_i23.TestEnum, int>> returnEnumIntMap(
    _i1.TestSession session,
    Map<_i24.TestEnum, int> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnEnumIntMap',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<_i23.TestEnum, int>>);
    });
  }

  _i3.Future<Map<String, _i23.TestEnum>> returnEnumMap(
    _i1.TestSession session,
    Map<String, _i24.TestEnum> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnEnumMap',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, _i23.TestEnum>>);
    });
  }

  _i3.Future<Map<String, double>> returnDoubleMap(
    _i1.TestSession session,
    Map<String, double> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnDoubleMap',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, double>>);
    });
  }

  _i3.Future<Map<String, double?>> returnDoubleMapNullableDoubles(
    _i1.TestSession session,
    Map<String, double?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnDoubleMapNullableDoubles',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, double?>>);
    });
  }

  _i3.Future<Map<String, bool>> returnBoolMap(
    _i1.TestSession session,
    Map<String, bool> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnBoolMap',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, bool>>);
    });
  }

  _i3.Future<Map<String, bool?>> returnBoolMapNullableBools(
    _i1.TestSession session,
    Map<String, bool?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnBoolMapNullableBools',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, bool?>>);
    });
  }

  _i3.Future<Map<String, String>> returnStringMap(
    _i1.TestSession session,
    Map<String, String> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnStringMap',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, String>>);
    });
  }

  _i3.Future<Map<String, String?>> returnStringMapNullableStrings(
    _i1.TestSession session,
    Map<String, String?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnStringMapNullableStrings',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, String?>>);
    });
  }

  _i3.Future<Map<String, DateTime>> returnDateTimeMap(
    _i1.TestSession session,
    Map<String, DateTime> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnDateTimeMap',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, DateTime>>);
    });
  }

  _i3.Future<Map<String, DateTime?>> returnDateTimeMapNullableDateTimes(
    _i1.TestSession session,
    Map<String, DateTime?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnDateTimeMapNullableDateTimes',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, DateTime?>>);
    });
  }

  _i3.Future<Map<String, _i5.ByteData>> returnByteDataMap(
    _i1.TestSession session,
    Map<String, _i5.ByteData> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnByteDataMap',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, _i5.ByteData>>);
    });
  }

  _i3.Future<Map<String, _i5.ByteData?>> returnByteDataMapNullableByteDatas(
    _i1.TestSession session,
    Map<String, _i5.ByteData?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnByteDataMapNullableByteDatas',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, _i5.ByteData?>>);
    });
  }

  _i3.Future<Map<String, _i12.SimpleData>> returnSimpleDataMap(
    _i1.TestSession session,
    Map<String, _i14.SimpleData> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnSimpleDataMap',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, _i12.SimpleData>>);
    });
  }

  _i3.Future<Map<String, _i12.SimpleData?>>
      returnSimpleDataMapNullableSimpleData(
    _i1.TestSession session,
    Map<String, _i14.SimpleData?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnSimpleDataMapNullableSimpleData',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, _i12.SimpleData?>>);
    });
  }

  _i3.Future<Map<String, _i12.SimpleData>?> returnSimpleDataMapNullable(
    _i1.TestSession session,
    Map<String, _i14.SimpleData>? map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnSimpleDataMapNullable',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, _i12.SimpleData>?>);
    });
  }

  _i3.Future<Map<String, _i12.SimpleData?>?>
      returnNullableSimpleDataMapNullableSimpleData(
    _i1.TestSession session,
    Map<String, _i14.SimpleData?>? map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnNullableSimpleDataMapNullableSimpleData',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, _i12.SimpleData?>?>);
    });
  }

  _i3.Future<Map<String, Duration>> returnDurationMap(
    _i1.TestSession session,
    Map<String, Duration> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnDurationMap',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, Duration>>);
    });
  }

  _i3.Future<Map<String, Duration?>> returnDurationMapNullableDurations(
    _i1.TestSession session,
    Map<String, Duration?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'mapParameters',
        methodName: 'returnDurationMapNullableDurations',
        parameters: {'map': map},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<Map<String, Duration?>>);
    });
  }
}

class MethodStreaming {
  MethodStreaming(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Stream<int> simpleStream(_i1.TestSession session) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'simpleStream',
        arguments: {},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Stream<int> neverEndingStreamWithDelay(
    _i1.TestSession session,
    int millisecondsDelay,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'neverEndingStreamWithDelay',
        arguments: {'millisecondsDelay': millisecondsDelay},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Future<void> methodCallEndpoint(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'methodCallEndpoint',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<int> intReturnFromStream(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'intReturnFromStream',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<int>);
    });
  }

  _i3.Future<int?> nullableIntReturnFromStream(
    _i1.TestSession session,
    _i3.Stream<int?> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'nullableIntReturnFromStream',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<int?>);
    });
  }

  _i3.Stream<int> intStreamFromValue(
    _i1.TestSession session,
    int value,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'intStreamFromValue',
        arguments: {'value': value},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Stream<int> intEchoStream(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'intEchoStream',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Stream<dynamic> dynamicEchoStream(
    _i1.TestSession session,
    _i3.Stream<dynamic> stream,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'dynamicEchoStream',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Stream<dynamic>);
    });
  }

  _i3.Stream<int?> nullableIntEchoStream(
    _i1.TestSession session,
    _i3.Stream<int?> stream,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'nullableIntEchoStream',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Stream<int?>);
    });
  }

  _i3.Future<void> voidReturnAfterStream(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'voidReturnAfterStream',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<void>);
    });
  }

  _i3.Stream<int> multipleIntEchoStreams(
    _i1.TestSession session,
    _i3.Stream<int> stream1,
    _i3.Stream<int> stream2,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'multipleIntEchoStreams',
        arguments: {},
        requestedInputStreams: [
          'stream1',
          'stream2',
        ],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {
          'stream1': stream1,
          'stream2': stream2,
        },
      ) as _i3.Stream<int>);
    });
  }

  _i3.Future<void> directVoidReturnWithStreamInput(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'directVoidReturnWithStreamInput',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<int> directOneIntReturnWithStreamInput(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'directOneIntReturnWithStreamInput',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<int>);
    });
  }

  _i3.Future<int> simpleInputReturnStream(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'simpleInputReturnStream',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<int>);
    });
  }

  _i3.Stream<int> simpleStreamWithParameter(
    _i1.TestSession session,
    int value,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'simpleStreamWithParameter',
        arguments: {'value': value},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Stream<_i12.SimpleData> simpleDataStream(
    _i1.TestSession session,
    int value,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'simpleDataStream',
        arguments: {'value': value},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<_i12.SimpleData>);
    });
  }

  _i3.Stream<_i12.SimpleData> simpleInOutDataStream(
    _i1.TestSession session,
    _i3.Stream<_i14.SimpleData> simpleDataStream,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'simpleInOutDataStream',
        arguments: {},
        requestedInputStreams: ['simpleDataStream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'simpleDataStream': simpleDataStream},
      ) as _i3.Stream<_i12.SimpleData>);
    });
  }

  _i3.Future<void> simpleEndpoint(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'simpleEndpoint',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> intParameter(
    _i1.TestSession session,
    int value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'intParameter',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<int> doubleInputValue(
    _i1.TestSession session,
    int value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'doubleInputValue',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<int>);
    });
  }

  _i3.Future<void> delayedResponse(
    _i1.TestSession session,
    int delay,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'delayedResponse',
        parameters: {'delay': delay},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Stream<int> delayedStreamResponse(
    _i1.TestSession session,
    int delay,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'delayedStreamResponse',
        arguments: {'delay': delay},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Future<void> delayedNeverListenedInputStream(
    _i1.TestSession session,
    int delay,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'delayedNeverListenedInputStream',
        arguments: {'delay': delay},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> delayedPausedInputStream(
    _i1.TestSession session,
    int delay,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'delayedPausedInputStream',
        arguments: {'delay': delay},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> completeAllDelayedResponses(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'completeAllDelayedResponses',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> inStreamThrowsException(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'inStreamThrowsException',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> inStreamThrowsSerializableException(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'inStreamThrowsSerializableException',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<void>);
    });
  }

  _i3.Stream<int> outStreamThrowsException(_i1.TestSession session) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'outStreamThrowsException',
        arguments: {},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Stream<int> outStreamThrowsSerializableException(
      _i1.TestSession session) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'outStreamThrowsSerializableException',
        arguments: {},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Future<void> throwsExceptionVoid(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'throwsExceptionVoid',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> throwsSerializableExceptionVoid(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'throwsSerializableExceptionVoid',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<int> throwsException(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'throwsException',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<int>);
    });
  }

  _i3.Future<int> throwsSerializableException(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'throwsSerializableException',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<int>);
    });
  }

  _i3.Stream<int> throwsExceptionStream(_i1.TestSession session) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'throwsExceptionStream',
        arguments: {},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Stream<int> throwsSerializableExceptionStream(_i1.TestSession session) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'throwsSerializableExceptionStream',
        arguments: {},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Future<bool> didInputStreamHaveError(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'didInputStreamHaveError',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<bool>);
    });
  }

  _i3.Future<bool> didInputStreamHaveSerializableExceptionError(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'methodStreaming',
        methodName: 'didInputStreamHaveSerializableExceptionError',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Future<bool>);
    });
  }
}

class AuthenticatedMethodStreaming {
  AuthenticatedMethodStreaming(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Stream<int> simpleStream(_i1.TestSession session) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'authenticatedMethodStreaming',
        methodName: 'simpleStream',
        arguments: {},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Stream<int> intEchoStream(
    _i1.TestSession session,
    _i3.Stream<int> stream,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'authenticatedMethodStreaming',
        methodName: 'intEchoStream',
        arguments: {},
        requestedInputStreams: ['stream'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'stream': stream},
      ) as _i3.Stream<int>);
    });
  }
}

class ModuleSerializationEndpoint {
  ModuleSerializationEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> serializeModuleObject(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'moduleSerialization',
        methodName: 'serializeModuleObject',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool>);
    });
  }

  _i3.Future<_i25.ModuleClass> modifyModuleObject(
    _i1.TestSession session,
    _i26.ModuleClass object,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'moduleSerialization',
        methodName: 'modifyModuleObject',
        parameters: {'object': object},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i25.ModuleClass>);
    });
  }

  _i3.Future<_i27.ModuleDatatype> serializeNestedModuleObject(
      _i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'moduleSerialization',
        methodName: 'serializeNestedModuleObject',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i27.ModuleDatatype>);
    });
  }
}

class NamedParametersEndpoint {
  NamedParametersEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> namedParametersMethod(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'namedParameters',
        methodName: 'namedParametersMethod',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool>);
    });
  }

  _i3.Future<bool> namedParametersMethodEqualInts(
      _i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'namedParameters',
        methodName: 'namedParametersMethodEqualInts',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool>);
    });
  }
}

class OptionalParametersEndpoint {
  OptionalParametersEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<int?> returnOptionalInt(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'optionalParameters',
        methodName: 'returnOptionalInt',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<int?>);
    });
  }
}

class RedisEndpoint {
  RedisEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> setSimpleData(
    _i1.TestSession session,
    String key,
    _i14.SimpleData data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'redis',
        methodName: 'setSimpleData',
        parameters: {
          'key': key,
          'data': data,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> setSimpleDataWithLifetime(
    _i1.TestSession session,
    String key,
    _i14.SimpleData data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'redis',
        methodName: 'setSimpleDataWithLifetime',
        parameters: {
          'key': key,
          'data': data,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<_i12.SimpleData?> getSimpleData(
    _i1.TestSession session,
    String key,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'redis',
        methodName: 'getSimpleData',
        parameters: {'key': key},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i12.SimpleData?>);
    });
  }

  _i3.Future<void> deleteSimpleData(
    _i1.TestSession session,
    String key,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'redis',
        methodName: 'deleteSimpleData',
        parameters: {'key': key},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> resetMessageCentralTest(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'redis',
        methodName: 'resetMessageCentralTest',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<_i12.SimpleData?> listenToChannel(
    _i1.TestSession session,
    String channel,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'redis',
        methodName: 'listenToChannel',
        parameters: {'channel': channel},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i12.SimpleData?>);
    });
  }

  _i3.Future<void> postToChannel(
    _i1.TestSession session,
    String channel,
    _i14.SimpleData data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'redis',
        methodName: 'postToChannel',
        parameters: {
          'channel': channel,
          'data': data,
        },
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<int> countSubscribedChannels(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'redis',
        methodName: 'countSubscribedChannels',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<int>);
    });
  }
}

class ServerOnlyScopedFieldModelEndpoint {
  ServerOnlyScopedFieldModelEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i28.ScopeServerOnlyField> getScopeServerOnlyField(
      _i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'serverOnlyScopedFieldModel',
        methodName: 'getScopeServerOnlyField',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<_i28.ScopeServerOnlyField>);
    });
  }
}

class SignInRequiredEndpoint {
  SignInRequiredEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> testMethod(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'signInRequired',
        methodName: 'testMethod',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool>);
    });
  }
}

class AdminScopeRequiredEndpoint {
  AdminScopeRequiredEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> testMethod(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'adminScopeRequired',
        methodName: 'testMethod',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<bool>);
    });
  }
}

class SimpleEndpoint {
  SimpleEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> setGlobalInt(
    _i1.TestSession session,
    int? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'simple',
        methodName: 'setGlobalInt',
        parameters: {'value': value},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<void> addToGlobalInt(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'simple',
        methodName: 'addToGlobalInt',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<int> getGlobalInt(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'simple',
        methodName: 'getGlobalInt',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<int>);
    });
  }

  _i3.Future<String> hello(
    _i1.TestSession session,
    String name,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'simple',
        methodName: 'hello',
        parameters: {'name': name},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String>);
    });
  }
}

class StreamingEndpoint {
  StreamingEndpoint(
    _endpointDispatch,
    _serializationManager,
  );
}

class StreamingLoggingEndpoint {
  StreamingLoggingEndpoint(
    _endpointDispatch,
    _serializationManager,
  );
}

class SubSubDirTestEndpoint {
  SubSubDirTestEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> testMethod(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'subSubDirTest',
        methodName: 'testMethod',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String>);
    });
  }
}

class SubDirTestEndpoint {
  SubDirTestEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> testMethod(_i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'subDirTest',
        methodName: 'testMethod',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String>);
    });
  }
}

class TestToolsEndpoint {
  TestToolsEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> returnsString(
    _i1.TestSession session,
    String string,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'testTools',
        methodName: 'returnsString',
        parameters: {'string': string},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String>);
    });
  }

  _i3.Stream<int> returnsStream(
    _i1.TestSession session,
    int n,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'testTools',
        methodName: 'returnsStream',
        arguments: {'n': n},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Future<List<int>> returnsListFromInputStream(
    _i1.TestSession session,
    _i3.Stream<int> numbers,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'testTools',
        methodName: 'returnsListFromInputStream',
        arguments: {},
        requestedInputStreams: ['numbers'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'numbers': numbers},
      ) as _i3.Future<List<int>>);
    });
  }

  _i3.Stream<int> returnsStreamFromInputStream(
    _i1.TestSession session,
    _i3.Stream<int> numbers,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'testTools',
        methodName: 'returnsStreamFromInputStream',
        arguments: {},
        requestedInputStreams: ['numbers'],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {'numbers': numbers},
      ) as _i3.Stream<int>);
    });
  }

  _i3.Future<void> createSimpleData(
    _i1.TestSession session,
    int data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'testTools',
        methodName: 'createSimpleData',
        parameters: {'data': data},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<void>);
    });
  }

  _i3.Future<List<_i12.SimpleData>> getAllSimpleData(
      _i1.TestSession session) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'testTools',
        methodName: 'getAllSimpleData',
        parameters: {},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<List<_i12.SimpleData>>);
    });
  }
}

class AuthenticatedTestToolsEndpoint {
  AuthenticatedTestToolsEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> returnsString(
    _i1.TestSession session,
    String string,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'authenticatedTestTools',
        methodName: 'returnsString',
        parameters: {'string': string},
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
      ) as _i3.Future<String>);
    });
  }

  _i3.Stream<int> returnsStream(
    _i1.TestSession session,
    int n,
  ) {
    return _i1.callStreamFunctionAndHandleExceptions(() async {
      var callContext = await _endpointDispatch.getMethodStreamCallContext(
        createSessionCallback: (_) =>
            (session as _i1.InternalTestSession).serverpodSession,
        endpointPath: 'authenticatedTestTools',
        methodName: 'returnsStream',
        arguments: {'n': n},
        requestedInputStreams: [],
        serializationManager: _serializationManager,
      );
      return (callContext.method.call(
        (session as _i1.InternalTestSession).serverpodSession,
        callContext.arguments,
        {},
      ) as _i3.Stream<int>);
    });
  }
}
