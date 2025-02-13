import 'dart:convert';

class Periodo {
  final String tempoFormatado;
  final double valorTotal;

  Periodo({
    required this.tempoFormatado,
    required this.valorTotal,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tempoFormatado': tempoFormatado,
      'valorTotal': valorTotal,
    };
  }

  factory Periodo.fromMap(Map<String, dynamic> map) {
    return Periodo(
      tempoFormatado: map['tempoFormatado'] as String,
      valorTotal: map['valorTotal'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Periodo.fromJson(String source) =>
      Periodo.fromMap(json.decode(source) as Map<String, dynamic>);
}
