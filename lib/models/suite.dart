import 'dart:convert';
import 'package:my_guia_de_moteis/models/categoria_item.dart';
import 'package:my_guia_de_moteis/models/periodo.dart';

class Suite {
  final String nome;
  final List<String> fotos;
  final List<CategoriaItem> categoriaItens;
  final List<Periodo> periodos;

  Suite({
    required this.nome,
    required this.fotos,
    required this.categoriaItens,
    required this.periodos,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'fotos': fotos,
      'categoriaItens':
          categoriaItens.map((categoriaItem) => categoriaItem.toMap()).toList(),
      'periodos': periodos.map((periodo) => periodo.toMap()).toList(),
    };
  }

  factory Suite.fromMap(Map<String, dynamic> map) {
    return Suite(
      nome: map['nome'] as String,
      fotos: List<String>.from((map['fotos'] as List<dynamic>)),
      categoriaItens: List<CategoriaItem>.from(
        (map['categoriaItens'] as List<dynamic>).map<CategoriaItem>(
          (categoriaItem) =>
              CategoriaItem.fromMap(categoriaItem as Map<String, dynamic>),
        ),
      ),
      periodos: List<Periodo>.from(
        (map['periodos'] as List<dynamic>).map<Periodo>(
          (periodo) => Periodo.fromMap(periodo as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Suite.fromJson(String source) =>
      Suite.fromMap(json.decode(source) as Map<String, dynamic>);
}
