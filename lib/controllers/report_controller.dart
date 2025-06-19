import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class MapaController with ChangeNotifier {
  LatLng? _ubicacionSeleccionada;

  LatLng? get ubicacionSeleccionada => _ubicacionSeleccionada;

  void seleccionarUbicacion(LatLng latlng) {
    _ubicacionSeleccionada = latlng;
    notifyListeners(); // Notifica cambios a la vista
  }
}
