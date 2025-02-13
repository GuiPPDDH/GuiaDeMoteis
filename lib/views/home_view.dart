import 'package:flutter/material.dart';
import 'package:my_guia_de_moteis/providers/motel_provider.dart';
import 'package:my_guia_de_moteis/widgets/booking_choice.dart';
import 'package:my_guia_de_moteis/widgets/filter_section.dart';
import 'package:my_guia_de_moteis/widgets/motel_card.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.of(context).size;
    final motelProvider = Provider.of<MotelProvider>(context);

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu_rounded),
          color: Colors.white,
        ),
        title: Row(
          children: [BookingChoice()],
        ),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: sizeOf.width,
        height: sizeOf.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            FilterSection(),
            Consumer(
              builder: (context, value, child) {
                if (motelProvider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (motelProvider.errorMessage != null) {
                  return Center(child: Text(motelProvider.errorMessage!));
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: motelProvider.moteis.length,
                    itemBuilder: (context, index) {
                      final motel = motelProvider.moteis[index];
                      return MotelCard(motel: motel);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
