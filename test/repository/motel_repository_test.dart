import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_guia_de_moteis/client/request_http_client.dart';
import 'package:my_guia_de_moteis/repository/motel_repository.dart';
import 'motel_repository_test.mocks.dart';

@GenerateMocks([RequestHttpClient, MotelRepository])
void main() {
  late MockRequestHttpClient mockHttpClient;
  late MotelRepository motelRepository;

  setUp(() {
    mockHttpClient = MockRequestHttpClient();
    motelRepository = MotelRepository(httpClient: mockHttpClient);
  });

  test('MotelRepository retorna dados corretamente', () async {
    when(mockHttpClient.get('/b/1IXK')).thenAnswer((_) async => {
          'data': {'moteis': []}
        });

    final result = await motelRepository.fetchMotelData();

    expect(result, isA<Map<String, dynamic>>());
    expect(result['data'], isA<Map<String, dynamic>>());
  });

  test('MotelRepository propaga erro quando HttpClient falha', () async {
    when(mockHttpClient.get('/b/1IXK')).thenThrow(Exception('Erro na API'));

    expect(() async => await motelRepository.fetchMotelData(), throwsException);
  });
}
