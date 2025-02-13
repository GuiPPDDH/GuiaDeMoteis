import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_guia_de_moteis/client/my_http_overrides.dart';
import 'package:provider/provider.dart';
import 'package:my_guia_de_moteis/client/request_http_client.dart';
import 'package:my_guia_de_moteis/repository/motel_repository.dart';
import 'package:my_guia_de_moteis/services/motel_service.dart';
import 'package:my_guia_de_moteis/providers/motel_provider.dart';
import 'package:my_guia_de_moteis/views/home_view.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RequestHttpClient>(
          create: (_) => RequestHttpClient(baseUrl: "https://jsonkeeper.com"),
        ),
        Provider<MotelRepository>(
          create: (context) => MotelRepository(
            httpClient: context.read<RequestHttpClient>(),
          ),
        ),
        Provider<MotelService>(
          create: (context) => MotelService(
            motelRepository: context.read<MotelRepository>(),
          ),
        ),
        ChangeNotifierProvider<MotelProvider>(
          create: (context) => MotelProvider(
            motelService: context.read<MotelService>(),
          )..loadMoteis(),
        ),
      ],
      child: MaterialApp(
        title: 'Guia de Motéis',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
