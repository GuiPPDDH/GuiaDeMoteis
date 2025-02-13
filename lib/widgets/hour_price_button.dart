import 'package:flutter/material.dart';

class HourPriceButton extends StatelessWidget {
  final String tempoFormatadoSuite;
  final double valorSuite;

  const HourPriceButton({
    super.key,
    required this.tempoFormatadoSuite,
    required this.valorSuite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tempoFormatadoSuite,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'R\$ $valorSuite',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
