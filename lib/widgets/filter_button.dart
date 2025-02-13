import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;

  const FilterButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}
