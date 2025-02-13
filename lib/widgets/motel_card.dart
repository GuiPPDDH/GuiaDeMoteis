import 'package:flutter/material.dart';
import 'package:my_guia_de_moteis/models/motel.dart';
import 'package:my_guia_de_moteis/widgets/category_item.dart';
import 'package:my_guia_de_moteis/widgets/hour_price_button.dart';
import 'package:my_guia_de_moteis/widgets/motel_image_list.dart';
import 'package:my_guia_de_moteis/widgets/motel_title.dart';

class MotelCard extends StatelessWidget {
  final Motel motel;

  const MotelCard({
    super.key,
    required this.motel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MotelTitle(
          fantasiaMotel: motel.fantasia,
          logoMotel: motel.logo,
          bairroMotel: motel.bairro,
        ),
        for (var suite in motel.suites)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MotelImageList(
                  nomeSuite: suite.nome,
                  fotosSuite: suite.fotos,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: suite.categoriaItens.length,
                    itemBuilder: (context, index) {
                      final categoria = suite.categoriaItens[index];
                      return CategoryItem(
                        categoriaItem: categoria,
                      );
                    },
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: suite.periodos.length,
                  itemBuilder: (context, index) {
                    final periodo = suite.periodos[index];
                    return HourPriceButton(
                      tempoFormatadoSuite: periodo.tempoFormatado,
                      valorSuite: periodo.valorTotal,
                    );
                  },
                )
              ],
            ),
          ),
      ],
    );
  }
}
