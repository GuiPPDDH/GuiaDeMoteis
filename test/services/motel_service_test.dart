import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_guia_de_moteis/repository/motel_repository.dart';
import 'package:my_guia_de_moteis/services/motel_service.dart';
import 'package:my_guia_de_moteis/models/motel.dart';

import '../repository/motel_repository_test.mocks.dart';

@GenerateMocks([MotelRepository, MotelService])
void main() {
  late MockMotelRepository mockMotelRepository;
  late MotelService motelService;

  setUp(() {
    mockMotelRepository = MockMotelRepository();
    motelService = MotelService(motelRepository: mockMotelRepository);
  });

  test('MotelService retorna lista de motéis corretamente', () async {
    when(mockMotelRepository.fetchMotelData()).thenAnswer((_) async => {
          'data': {
            'moteis': [
              {'id': 1, 'name': 'Motel A'}
            ]
          }
        });

    final result = await motelService.fetchMoteis();

    expect(result, isA<List<Motel>>());
    expect(result.first.fantasia, 'Motel A');
  });

  test('MotelService lança erro quando resposta está incorreta', () async {
    when(mockMotelRepository.fetchMotelData())
        .thenAnswer((_) async => {'data': {}});

    expect(() async => await motelService.fetchMoteis(), throwsException);
  });
}
