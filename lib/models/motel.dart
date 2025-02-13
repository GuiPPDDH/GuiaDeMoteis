import 'dart:convert';
import 'package:my_guia_de_moteis/models/suite.dart';

class Motel {
  final String fantasia;
  final String logo;
  final String bairro;
  final List<Suite> suites;

  Motel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.suites,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fantasia': fantasia,
      'logo': logo,
      'bairro': bairro,
      'suites': suites.map((suite) => suite.toMap()).toList(),
    };
  }

  factory Motel.fromMap(Map<String, dynamic> map) {
    return Motel(
      fantasia: map['fantasia'] as String,
      logo: map['logo'] as String,
      bairro: map['bairro'] as String,
      suites: List<Suite>.from(
        (map['suites'] as List<dynamic>).map<Suite>(
          (suite) => Suite.fromMap(suite as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Motel.fromJson(String source) =>
      Motel.fromMap(json.decode(source) as Map<String, dynamic>);
}
