import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';
import 'dart:typed_data';

enum ReportStatus { success, error, loading }

class ReportController with ChangeNotifier {
  final CollectionReference reports = FirebaseFirestore.instance.collection(
    'reports',
  );
  final FirebaseStorage storage = FirebaseStorage.instance;

  ReportStatus _status = ReportStatus.loading;
  ReportStatus get status => _status;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> submitReport({
    required String tipoResiduo,
    required double peso,
    required LatLng ubicacion,
    File? imagen, // Para móvil
    Uint8List? imagenBytes, // Para web
  }) async {
    try {
      _status = ReportStatus.loading;
      notifyListeners();

      // Validación de plataforma
      if ((kIsWeb && imagenBytes == null) || (!kIsWeb && imagen == null)) {
        throw Exception('Debe proporcionar una imagen válida');
      }

      String? imageUrl;

      // 1. Subir imagen a Firebase Storage (versión multiplataforma)
      if (kIsWeb) {
        // Para web
        String imageName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference ref = storage.ref().child("reports/$imageName.jpg");
        await ref.putData(imagenBytes!);
        imageUrl = await ref.getDownloadURL();
      } else {
        // Para móvil
        String imageName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference ref = storage.ref().child("reports/$imageName.jpg");
        await ref.putFile(imagen!);
        imageUrl = await ref.getDownloadURL();
      }

      // 2. Guardar datos del reporte en Firestore
      await reports.add({
        'tipo_residuo': tipoResiduo,
        'peso': peso,
        'ubicacion': GeoPoint(ubicacion.latitude, ubicacion.longitude),
        'foto_url': imageUrl,
        'fecha': DateTime.now(),
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
