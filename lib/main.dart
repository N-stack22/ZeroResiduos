// main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/location_view.dart';
import 'controllers/report_controller.dart'; // Asegúrate de tener este archivo

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MapaController())],
      child: MaterialApp(
        home: LocationView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
