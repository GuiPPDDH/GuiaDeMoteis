import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_guia_de_moteis/providers/motel_provider.dart';
import 'package:my_guia_de_moteis/models/motel.dart';
import 'package:my_guia_de_moteis/services/motel_service.dart';

import 'motel_provider_test.mocks.dart';

@GenerateMocks([MotelService, MotelProvider])
void main() {
  late MockMotelService mockMotelService;
  late MotelProvider motelProvider;

  setUp(() {
    mockMotelService = MockMotelService();
    motelProvider = MotelProvider(motelService: mockMotelService);
  });

  test('MotelProvider carrega motéis corretamente', () async {
    when(mockMotelService.fetchMoteis()).thenAnswer(
        (_) async => [Motel(fantasia: '', bairro: '', logo: '', suites: [])]);

    await motelProvider.loadMoteis();

    expect(motelProvider.moteis, isNotEmpty);
    expect(motelProvider.isLoading, false);
    expect(motelProvider.errorMessage, isNull);
  });

  test('MotelProvider trata erro corretamente', () async {
    when(mockMotelService.fetchMoteis())
        .thenThrow(Exception('Erro no serviço'));

    await motelProvider.loadMoteis();

    expect(motelProvider.moteis, isEmpty);
    expect(motelProvider.isLoading, false);
    expect(motelProvider.errorMessage, isNotNull);
  });
}
