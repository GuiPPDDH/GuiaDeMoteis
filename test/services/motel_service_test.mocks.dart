// Mocks generated by Mockito 5.4.5 from annotations
// in my_guia_de_moteis/test/services/motel_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:my_guia_de_moteis/client/request_http_client.dart' as _i2;
import 'package:my_guia_de_moteis/models/motel.dart' as _i6;
import 'package:my_guia_de_moteis/repository/motel_repository.dart' as _i3;
import 'package:my_guia_de_moteis/services/motel_service.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRequestHttpClient_0 extends _i1.SmartFake
    implements _i2.RequestHttpClient {
  _FakeRequestHttpClient_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeMotelRepository_1 extends _i1.SmartFake
    implements _i3.MotelRepository {
  _FakeMotelRepository_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [MotelRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMotelRepository extends _i1.Mock implements _i3.MotelRepository {
  MockMotelRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RequestHttpClient get httpClient =>
      (super.noSuchMethod(
            Invocation.getter(#httpClient),
            returnValue: _FakeRequestHttpClient_0(
              this,
              Invocation.getter(#httpClient),
            ),
          )
          as _i2.RequestHttpClient);

  @override
  _i4.Future<Map<String, dynamic>> fetchMotelData() =>
      (super.noSuchMethod(
            Invocation.method(#fetchMotelData, []),
            returnValue: _i4.Future<Map<String, dynamic>>.value(
              <String, dynamic>{},
            ),
          )
          as _i4.Future<Map<String, dynamic>>);
}

/// A class which mocks [MotelService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMotelService extends _i1.Mock implements _i5.MotelService {
  MockMotelService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.MotelRepository get motelRepository =>
      (super.noSuchMethod(
            Invocation.getter(#motelRepository),
            returnValue: _FakeMotelRepository_1(
              this,
              Invocation.getter(#motelRepository),
            ),
          )
          as _i3.MotelRepository);

  @override
  _i4.Future<List<_i6.Motel>> fetchMoteis() =>
      (super.noSuchMethod(
            Invocation.method(#fetchMoteis, []),
            returnValue: _i4.Future<List<_i6.Motel>>.value(<_i6.Motel>[]),
          )
          as _i4.Future<List<_i6.Motel>>);
}
