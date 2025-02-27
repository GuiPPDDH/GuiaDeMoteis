import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_guia_de_moteis/exceptions/client_error_exception.dart';
import 'package:my_guia_de_moteis/exceptions/json_decoding_exception.dart';
import 'package:my_guia_de_moteis/exceptions/network_exception.dart';
import 'package:my_guia_de_moteis/exceptions/request_exception.dart';
import 'package:my_guia_de_moteis/exceptions/server_error_exception.dart';
import 'package:my_guia_de_moteis/exceptions/timeout_request_exception.dart';

class RequestHttpClient {
  final String baseUrl;

  RequestHttpClient({required this.baseUrl});

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    final url = Uri.parse('$baseUrl/$endpoint');

    try {
      final response = await http
          .get(url, headers: headers)
          .timeout(const Duration(seconds: 10));

      return switch (response.statusCode) {
        200 => () {
            try {
              final decodedBody = utf8.decode(response.bodyBytes);
              return jsonDecode(decodedBody) as Map<String, dynamic>;
            } on FormatException catch (e) {
              throw JsonDecodingException(
                  'Erro ao decodificar JSON: ${e.message}\nResposta: ${response.body}');
            } catch (e) {
              throw RequestException(
                  'Erro inesperado ao decodificar JSON: $e\nResposta: ${response.body}');
            }
          }(),
        >= 400 && <= 499 => throw ClientErrorException(
            'Erro do cliente (status code: ${response.statusCode}):\nResposta: ${response.body}'),
        >= 500 => throw ServerErrorException(
            'Erro do servidor (status code: ${response.statusCode}):\nResposta: ${response.body}'),
        _ => throw RequestException(
            'Erro ao buscar os dados (status code: ${response.statusCode}):\nResposta: ${response.body}'),
      };
    } on SocketException catch (e) {
      throw NetworkException('Erro de conexão: ${e.message}');
    } on TimeoutException catch (e) {
      throw TimeoutRequestException(
          'Tempo de requisição excedido: ${e.message}');
    } catch (e) {
      throw RequestException('Erro inesperado: $e');
    }
  }
}
