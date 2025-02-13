import 'package:flutter/material.dart';

class MotelTitle extends StatelessWidget {
  final String fantasiaMotel;
  final String logoMotel;
  final String bairroMotel;

  const MotelTitle({
    super.key,
    required this.fantasiaMotel,
    required this.logoMotel,
    required this.bairroMotel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 16,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(logoMotel),
                backgroundColor: Colors.grey.shade300,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fantasiaMotel,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(bairroMotel),
                  Row(
                    spacing: 8,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          spacing: 4,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text('4.8'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text('152 avaliações'),
                          Icon(Icons.arrow_drop_down_sharp)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
