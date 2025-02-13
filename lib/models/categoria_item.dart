import 'dart:convert';

class CategoriaItem {
  final String nome;
  final String icone;

  CategoriaItem({
    required this.nome,
    required this.icone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'icone': icone,
    };
  }

  factory CategoriaItem.fromMap(Map<String, dynamic> map) {
    return CategoriaItem(
      nome: map['nome'] as String,
      icone: map['icone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriaItem.fromJson(String source) =>
      CategoriaItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
