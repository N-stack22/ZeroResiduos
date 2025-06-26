import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'views/location_view.dart';
import 'controllers/report_controller.dart';
import 'controllers/mapa_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Carga el archivo .env desde la raíz del proyecto
  await dotenv.load(fileName: ".env");

  try {
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_KEY']!,
    );
    print('✅ Supabase inicializado correctamente');
  } catch (e) {
    print('❌ Error inicializando Supabase: $e');
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Error inicializando la aplicación: $e')),
        ),
      ),
    );
    return;
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
        ChangeNotifierProvider(create: (_) => ReportController()),
      ],
      child: MaterialApp(
        title: 'Reporte de Residuos',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const LocationView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
