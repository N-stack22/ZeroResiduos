import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class MapaController with ChangeNotifier {
  LatLng? _ubicacionSeleccionada;

  LatLng? get ubicacionSeleccionada => _ubicacionSeleccionada;

  void seleccionarUbicacion(LatLng latlng) {
    _ubicacionSeleccionada = latlng;
    notifyListeners(); // Notifica cambios a la vista
  }
}

class ReportController {
  final CollectionReference reports = FirebaseFirestore.instance.collection(
    'reports',
  );

  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> submitReport({
    required String tipoResiduo,
    required double peso,
    required LatLng ubicacion,
    required File imagen,
  }) async {
    try {
      // 1. Subir imagen a Firebase Storage
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = storage.ref().child("reports/$imageName.jpg");
      await ref.putFile(imagen);

      // 2. Obtener URL de descarga
      String imageUrl = await ref.getDownloadURL();

      // 3. Guardar datos del reporte en Firestore
      await reports.add({
        'tipo_residuo': tipoResiduo,
        'peso': peso,
        'ubicacion': GeoPoint(ubicacion.latitude, ubicacion.longitude),
        'foto_url': imageUrl,
        'fecha': DateTime.now(),
      });
    } catch (e) {
      throw Exception("Error al enviar el reporte: $e");
    }
  }
}
