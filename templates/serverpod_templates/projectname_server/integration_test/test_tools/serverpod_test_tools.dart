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
import 'package:deletable_server/src/generated/protocol.dart';
import 'package:deletable_server/src/generated/endpoints.dart';

@_i1.isTestGroup
withServerpod(
  String testGroupName,
  _i1.TestClosure<TestEndpoints> testClosure,
) {
  _i1.buildWithServerpod<TestEndpoints>(_i1.TestServerpod(
    testEndpoints: TestEndpoints(),
    endpoints: Endpoints(),
    serializationManager: Protocol(),
  ))(
    testGroupName,
    testClosure,
  );
}

class TestEndpoints extends _i1.TestEndpointsBase {
  late final _i2.EndpointDispatch endpoints;

  late final _i2.SerializationManager serializationManager;

  late final ExampleEndpoint example;

  @override
  initialize(
    _i2.SerializationManager serializationManager,
    _i2.EndpointDispatch endpoints,
  ) {
    this.endpoints = endpoints;
    this.serializationManager = serializationManager;
    example = ExampleEndpoint(
      endpoints,
      serializationManager,
    );
  }
}

class ExampleEndpoint {
  ExampleEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> hello(
    _i1.TestSession session,
    String name,
  ) async {
    try {
      var callContext = await _endpointDispatch.getMethodCallContext(
        createSessionCallback: (_) => session.session,
        endpointPath: 'example',
        methodName: 'hello',
        parameters: {'name': name},
        serializationManager: _serializationManager,
      );
      return await (callContext.method.call(
        session.session,
        callContext.arguments,
      ) as _i3.Future<String>);
    } on _i2.NotAuthorizedException {
      throw Exception("Not authorized.");
    } catch (e) {
      throw StateError("Invalid test state.");
    }
  }
}
