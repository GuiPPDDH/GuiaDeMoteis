import 'dart:convert';
import 'package:http/http.dart' as http;

class RequestHttpClient {
  final String baseUrl;

  RequestHttpClient({required this.baseUrl});

  Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        final decodedBody = utf8.decode(response.bodyBytes);
        return jsonDecode(decodedBody) as Map<String, dynamic>;
      } catch (e) {
        throw Exception(
            'Erro ao decodificar JSON: $e\nResposta: ${response.body}');
      }
    } else {
      throw Exception(
          'Erro ao buscar os dados: ${response.statusCode}\nResposta: ${response.body}');
    }
  }
}
