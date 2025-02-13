import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_guia_de_moteis/client/request_http_client.dart';
import 'http_client_test.mocks.dart';

@GenerateMocks([RequestHttpClient])
void main() {
  late MockRequestHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockRequestHttpClient();
  });

  test('HttpClient retorna um mapa de dados', () async {
    when(mockHttpClient.get('/b/1IXK'))
        .thenAnswer((_) async => {'data': 'test'});

    final result = await mockHttpClient.get('/b/1IXK');

    expect(result, isA<Map<String, dynamic>>());
    expect(result['data'], 'test');
  });

  test('HttpClient lança exceção em erro', () async {
    when(mockHttpClient.get('/b/1IXK')).thenThrow(Exception('Erro de conexão'));

    expect(() async => await mockHttpClient.get('/b/1IXK'), throwsException);
  });
}
