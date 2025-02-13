import 'package:my_guia_de_moteis/models/motel.dart';
import 'package:my_guia_de_moteis/repository/motel_repository.dart';

class MotelService {
  final MotelRepository motelRepository;

  MotelService({required this.motelRepository});

  Future<List<Motel>> fetchMoteis() async {
    try {
      final motelData = await motelRepository.fetchMotelData();
      if (motelData.containsKey('data') &&
          motelData['data'].containsKey('moteis')) {
        return (motelData['data']['moteis'] as List<dynamic>)
            .map<Motel>((motel) => Motel.fromMap(motel as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('A chave "moteis" não foi encontrada na resposta.');
      }
    } catch (e) {
      throw Exception('Erro ao buscar motéis: $e');
    }
  }
}
