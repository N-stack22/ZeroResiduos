// lib/controllers/mapa_controller.dart

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class MapaController with ChangeNotifier {
  LatLng? _ubicacionSeleccionada;
  bool _cargandoUbicacion = false;
  String? _errorUbicacion;

  // Getters para acceder a los estados
  LatLng? get ubicacionSeleccionada => _ubicacionSeleccionada;
  bool get cargandoUbicacion => _cargandoUbicacion;
  String? get errorUbicacion => _errorUbicacion;

  // Método para seleccionar ubicación manualmente (desde el mapa)
  void seleccionarUbicacion(LatLng nuevaUbicacion) {
    _ubicacionSeleccionada = nuevaUbicacion;
    _errorUbicacion = null;
    notifyListeners();
  }

  // Método para obtener la ubicación actual del dispositivo
  Future<void> obtenerUbicacionActual() async {
    try {
      _cargandoUbicacion = true;
      _errorUbicacion = null;
      notifyListeners();

      // Simulación de obtención de ubicación (reemplazar con paquete de geolocalización real)
      await Future.delayed(const Duration(seconds: 1));

      // Ubicación de ejemplo (Centro de Lima)
      _ubicacionSeleccionada = const LatLng(-12.0464, -77.0428);
    } catch (e) {
      _errorUbicacion = 'Error al obtener la ubicación: ${e.toString()}';
    } finally {
      _cargandoUbicacion = false;
      notifyListeners();
    }
  }

  // Método para limpiar la ubicación seleccionada
  void limpiarUbicacion() {
    _ubicacionSeleccionada = null;
    _errorUbicacion = null;
    notifyListeners();
  }

  // Método para validar si hay una ubicación seleccionada
  bool ubicacionValida() {
    return _ubicacionSeleccionada != null;
  }
}
