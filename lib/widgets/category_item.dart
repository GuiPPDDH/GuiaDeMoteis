import 'package:flutter/material.dart';
import 'package:my_guia_de_moteis/models/categoria_item.dart';

class CategoryItem extends StatelessWidget {
  final CategoriaItem categoriaItem;

  const CategoryItem({
    super.key,
    required this.categoriaItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              categoriaItem.icone,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
