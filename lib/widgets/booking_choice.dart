import 'package:flutter/material.dart';

enum BookingOption {
  now,
  later,
}

class BookingChoice extends StatefulWidget {
  const BookingChoice({super.key});

  @override
  State<BookingChoice> createState() => _BookingChoiceState();
}

class _BookingChoiceState extends State<BookingChoice> {
  BookingOption selectedOption = BookingOption.now;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<BookingOption>(
      segments: const <ButtonSegment<BookingOption>>[
        ButtonSegment<BookingOption>(
          value: BookingOption.now,
          label: Text('ir agora'),
          icon: Icon(Icons.flash_on),
        ),
        ButtonSegment<BookingOption>(
          value: BookingOption.later,
          label: Text('ir outro dia'),
          icon: Icon(Icons.calendar_today),
        ),
      ],
      selected: <BookingOption>{selectedOption},
      onSelectionChanged: (Set<BookingOption> newSelection) {
        setState(() {
          selectedOption = newSelection.first;
        });
      },
      showSelectedIcon: false, // Oculta o ícone de seleção automática
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return Colors.red;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.red;
          }
          return Colors.white;
        }),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }
}
