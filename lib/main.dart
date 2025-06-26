import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Para kIsWeb
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart'; // Importante para Firebase
import 'views/location_view.dart';
import 'controllers/report_controller.dart'; // Asegúrate de tener este controlador
import 'controllers/mapa_controller.dart'; // Si usas MapaController
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('✅ Firebase inicializado correctamente');
  } catch (e) {
    print('❌ Error inicializando Firebase: $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MapaController()),
        ChangeNotifierProvider(create: (_) => ReportController()), // Añade esto
      ],
      child: MaterialApp(
        title: 'Reporte de Residuos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const LocationView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
