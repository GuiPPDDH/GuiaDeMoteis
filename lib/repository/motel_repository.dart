import 'package:my_guia_de_moteis/client/request_http_client.dart';

class MotelRepository {
  final RequestHttpClient httpClient;

  MotelRepository({required this.httpClient});

  Future<Map<String, dynamic>> fetchMotelData() async {
    return await httpClient.get('b/1IXK');
  }
}
