import 'package:first_proj_flutter_dio/src/my_navigation_widget.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aprendendo Flutter DIO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyNavigation(title: 'Desafios DIO'),
    );
  }
}
