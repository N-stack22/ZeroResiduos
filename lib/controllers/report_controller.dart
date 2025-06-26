import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';
import 'dart:typed_data';

enum ReportStatus { success, error, loading }

class ReportController with ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;

  ReportStatus _status = ReportStatus.loading;
  String? _errorMessage;

  ReportStatus get status => _status;
  String? get errorMessage => _errorMessage;

  Future<void> submitReport({
    required String tipoResiduo,
    required double peso,
    required LatLng ubicacion,
    File? imagen,
    Uint8List? imagenBytes,
  }) async {
    try {
      _status = ReportStatus.loading;
      notifyListeners();

      // Validación básica de imagen
      if ((kIsWeb && imagenBytes == null) || (!kIsWeb && imagen == null)) {
        throw Exception('Debe proporcionar una imagen válida');
      }

      // 1. Subir imagen
      final String imageName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final String imagePath = 'reports/$imageName';

      if (kIsWeb) {
        await _supabase.storage
            .from('reports')
            .uploadBinary(imagePath, imagenBytes!);
      } else {
        await _supabase.storage.from('reports').upload(imagePath, imagen!);
      }

      // Obtener URL pública
      final String imageUrl = _supabase.storage
          .from('reports')
          .getPublicUrl(imagePath);

      // 2. Guardar reporte en la base de datos
      await _supabase.from('reports').insert({
        'tipo_residuo': tipoResiduo,
        'peso': peso,
        'latitud': ubicacion.latitude,
        'longitud': ubicacion.longitude,
        'foto_url': imageUrl,
        'fecha': DateTime.now().toIso8601String(),
        'estado': 'pendiente',
      });

      _status = ReportStatus.success;
    } catch (e) {
      _status = ReportStatus.error;
      _errorMessage = "Error al enviar el reporte: ${e.toString()}";
      debugPrint('Error en submitReport: $e');
    } finally {
      notifyListeners();
    }
  }

  void resetStatus() {
    _status = ReportStatus.loading;
    _errorMessage = null;
    notifyListeners();
  }
}
