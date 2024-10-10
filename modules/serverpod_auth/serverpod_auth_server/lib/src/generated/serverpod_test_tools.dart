/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_local_identifiers

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_test/serverpod_test.dart' as _i1;
import 'package:serverpod/serverpod.dart' as _i2;
import 'dart:async' as _i3;
import 'package:serverpod_auth_server/src/generated/user_info.dart' as _i4;
import 'package:serverpod_auth_server/src/generated/authentication_response.dart'
    as _i5;
import 'package:serverpod_auth_server/src/generated/apple_auth_info.dart'
    as _i6;
import 'package:serverpod_auth_server/src/generated/user_settings_config.dart'
    as _i7;
import 'dart:typed_data' as _i8;
import 'package:serverpod_auth_server/src/generated/protocol.dart';
import 'package:serverpod_auth_server/src/generated/endpoints.dart';
export 'package:serverpod_test/serverpod_test_public_exports.dart';

@_i1.isTestGroup
withServerpod(
  String testGroupName,
  _i1.TestClosure<TestEndpoints> testClosure, {
  String? runMode,
  bool? enableSessionLogging,
  _i1.RollbackDatabase? rollbackDatabase,
  bool? applyMigrations,
}) {
  _i1.buildWithServerpod<InternalTestEndpoints>(
    testGroupName,
    _i1.TestServerpod(
      serverEndpoints: _i1.TestEndpointPair(
        Endpoints(),
        InternalTestEndpoints(),
      ),
      moduleEndpoints: [],
      serializationManager: Protocol(),
      runMode: runMode,
      applyMigrations: applyMigrations,
      isDatabaseEnabled: true,
    ),
    maybeRollbackDatabase: rollbackDatabase,
    maybeEnableSessionLogging: enableSessionLogging,
  )(testClosure);
}

class TestEndpoints {
  late final _AdminEndpoint admin;

  late final _AppleEndpoint apple;

  late final _EmailEndpoint email;

  late final _FirebaseEndpoint firebase;

  late final _GoogleEndpoint google;

  late final _StatusEndpoint status;

  late final _UserEndpoint user;
}

class InternalTestEndpoints extends TestEndpoints
    implements _i1.InternalTestEndpoints {
  @override
  initialize(
    _i2.SerializationManager serializationManager,
    _i2.EndpointDispatch endpoints,
  ) {
    admin = _AdminEndpoint(
      endpoints,
      serializationManager,
    );
    apple = _AppleEndpoint(
      endpoints,
      serializationManager,
    );
    email = _EmailEndpoint(
      endpoints,
      serializationManager,
    );
    firebase = _FirebaseEndpoint(
      endpoints,
      serializationManager,
    );
    google = _GoogleEndpoint(
      endpoints,
      serializationManager,
    );
    status = _StatusEndpoint(
      endpoints,
      serializationManager,
    );
    user = _UserEndpoint(
      endpoints,
      serializationManager,
    );
  }

  @override
  initializeModules(
      Map<String, (_i2.SerializationManagerServer, _i2.EndpointDispatch)>
          modulesContext) {}
}

class _AdminEndpoint {
  _AdminEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i4.UserInfo?> getUserInfo(
    _i1.TestSessionBuilder sessionBuilder,
    int userId,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'admin',
        method: 'getUserInfo',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'admin',
        methodName: 'getUserInfo',
        parameters: {'userId': userId},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<_i4.UserInfo?>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<void> blockUser(
    _i1.TestSessionBuilder sessionBuilder,
    int userId,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'admin',
        method: 'blockUser',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'admin',
        methodName: 'blockUser',
        parameters: {'userId': userId},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<void>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<void> unblockUser(
    _i1.TestSessionBuilder sessionBuilder,
    int userId,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'admin',
        method: 'unblockUser',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'admin',
        methodName: 'unblockUser',
        parameters: {'userId': userId},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<void>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }
}

class _AppleEndpoint {
  _AppleEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i5.AuthenticationResponse> authenticate(
    _i1.TestSessionBuilder sessionBuilder,
    _i6.AppleAuthInfo authInfo,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'apple',
        method: 'authenticate',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'apple',
        methodName: 'authenticate',
        parameters: {'authInfo': authInfo},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<_i5.AuthenticationResponse>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }
}

class _EmailEndpoint {
  _EmailEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i5.AuthenticationResponse> authenticate(
    _i1.TestSessionBuilder sessionBuilder,
    String email,
    String password,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'email',
        method: 'authenticate',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'email',
        methodName: 'authenticate',
        parameters: {
          'email': email,
          'password': password,
        },
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<_i5.AuthenticationResponse>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<bool> changePassword(
    _i1.TestSessionBuilder sessionBuilder,
    String oldPassword,
    String newPassword,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'email',
        method: 'changePassword',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'email',
        methodName: 'changePassword',
        parameters: {
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        },
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<bool>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<bool> initiatePasswordReset(
    _i1.TestSessionBuilder sessionBuilder,
    String email,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'email',
        method: 'initiatePasswordReset',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'email',
        methodName: 'initiatePasswordReset',
        parameters: {'email': email},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<bool>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<bool> resetPassword(
    _i1.TestSessionBuilder sessionBuilder,
    String verificationCode,
    String password,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'email',
        method: 'resetPassword',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'email',
        methodName: 'resetPassword',
        parameters: {
          'verificationCode': verificationCode,
          'password': password,
        },
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<bool>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<bool> createAccountRequest(
    _i1.TestSessionBuilder sessionBuilder,
    String userName,
    String email,
    String password,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'email',
        method: 'createAccountRequest',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'email',
        methodName: 'createAccountRequest',
        parameters: {
          'userName': userName,
          'email': email,
          'password': password,
        },
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<bool>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<_i4.UserInfo?> createAccount(
    _i1.TestSessionBuilder sessionBuilder,
    String email,
    String verificationCode,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'email',
        method: 'createAccount',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'email',
        methodName: 'createAccount',
        parameters: {
          'email': email,
          'verificationCode': verificationCode,
        },
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<_i4.UserInfo?>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }
}

class _FirebaseEndpoint {
  _FirebaseEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i5.AuthenticationResponse> authenticate(
    _i1.TestSessionBuilder sessionBuilder,
    String idToken,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'firebase',
        method: 'authenticate',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'firebase',
        methodName: 'authenticate',
        parameters: {'idToken': idToken},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<_i5.AuthenticationResponse>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }
}

class _GoogleEndpoint {
  _GoogleEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i5.AuthenticationResponse> authenticateWithServerAuthCode(
    _i1.TestSessionBuilder sessionBuilder,
    String authenticationCode,
    String? redirectUri,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'google',
        method: 'authenticateWithServerAuthCode',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'google',
        methodName: 'authenticateWithServerAuthCode',
        parameters: {
          'authenticationCode': authenticationCode,
          'redirectUri': redirectUri,
        },
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<_i5.AuthenticationResponse>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<_i5.AuthenticationResponse> authenticateWithIdToken(
    _i1.TestSessionBuilder sessionBuilder,
    String idToken,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'google',
        method: 'authenticateWithIdToken',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'google',
        methodName: 'authenticateWithIdToken',
        parameters: {'idToken': idToken},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<_i5.AuthenticationResponse>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }
}

class _StatusEndpoint {
  _StatusEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> isSignedIn(_i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'status',
        method: 'isSignedIn',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'status',
        methodName: 'isSignedIn',
        parameters: {},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<bool>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<void> signOut(_i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'status',
        method: 'signOut',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'status',
        methodName: 'signOut',
        parameters: {},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<void>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<_i4.UserInfo?> getUserInfo(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'status',
        method: 'getUserInfo',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'status',
        methodName: 'getUserInfo',
        parameters: {},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<_i4.UserInfo?>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<_i7.UserSettingsConfig> getUserSettingsConfig(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'status',
        method: 'getUserSettingsConfig',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'status',
        methodName: 'getUserSettingsConfig',
        parameters: {},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<_i7.UserSettingsConfig>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }
}

class _UserEndpoint {
  _UserEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> removeUserImage(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'user',
        method: 'removeUserImage',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'user',
        methodName: 'removeUserImage',
        parameters: {},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<bool>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<bool> setUserImage(
    _i1.TestSessionBuilder sessionBuilder,
    _i8.ByteData image,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'user',
        method: 'setUserImage',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'user',
        methodName: 'setUserImage',
        parameters: {'image': image},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<bool>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<bool> changeUserName(
    _i1.TestSessionBuilder sessionBuilder,
    String userName,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'user',
        method: 'changeUserName',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'user',
        methodName: 'changeUserName',
        parameters: {'userName': userName},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<bool>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }

  _i3.Future<bool> changeFullName(
    _i1.TestSessionBuilder sessionBuilder,
    String fullName,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'user',
        method: 'changeFullName',
      );
      var _localCallContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => _localUniqueSession,
        endpointPath: 'user',
        methodName: 'changeFullName',
        parameters: {'fullName': fullName},
        serializationManager: _serializationManager,
      );
      var _localReturnValue = await (_localCallContext.method.call(
        _localUniqueSession,
        _localCallContext.arguments,
      ) as _i3.Future<bool>);
      await _localUniqueSession.close();
      return _localReturnValue;
    });
  }
}
