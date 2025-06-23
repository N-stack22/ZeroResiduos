// lib/views/location_view.dart

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:latlong2/latlong.dart';

class ConfirmationView extends StatelessWidget {
  final String tipoResiduo;
  final double peso;
  final LatLng ubicacion;
  final File imagen;

  const ConfirmationView({
    Key? key,
    required this.tipoResiduo,
    required this.peso,
    required this.ubicacion,
    required this.imagen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1920,
      height: 1026,
      color: Colors.transparent,
      child: Column(
        children: [
          // Contenedor negro superior
          Container(
            width: 1920,
            height: 85,
            color: Colors.black,
            alignment: Alignment.center,
            child: Container(
              width: 1152,
              height: 65,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo a la izquierda
                  Container(
                    width: 242.2,
                    height: 65,
                    color: Colors.black,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Los tres contenedores horizontales a la derecha
                  Container(
                    width: 734.19,
                    height: 41,
                    color: Colors.black,
                    child: Row(
                      children: [
                        // Contenedor 1 - Reportar Residuos
                        Expanded(
                          flex: 242,
                          child: Container(
                            height: 41,
                            color: Colors.black,
                            alignment: Alignment.center,
                            child: Text(
                              'Reportar Residuos',
                              style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10), // Espacio entre contenedores
                        // Contenedor 2 - Información Educativa
                        Expanded(
                          flex: 260,
                          child: Container(
                            height: 41,
                            color: Colors.black,
                            alignment: Alignment.center,
                            child: Text(
                              'Información Educativa',
                              style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10), // Espacio entre contenedores
                        // Contenedor 3 - Dashboard
                        Expanded(
                          flex: 158,
                          child: Container(
                            height: 40.73,
                            color: Colors.black,
                            alignment: Alignment.center,
                            child: Text(
                              'Dashboard',
                              style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Contenedor gris claro debajo del negro
          Container(
            width: 1920,
            height: 150,
            color: Colors.grey[300],
            child: Center(
              child: Container(
                width: 1163,
                height: 110,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estimado Usuario,',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Para realizar su reporte, primero debe completar los 03 pasos',
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontWeight: FontWeight.normal,
                        fontSize: 32,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Tercer contenedor con ScrollView
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: 1920,
                color: Colors.white,
                child: Row(
                  children: [
                    // Contenedor blanco a la izquierda
                    Expanded(
                      flex: 340,
                      child: Container(
                        height: 790,
                        color: Colors.white,
                        child: Column(
                          children: [
                            // Contenedor 1 - Ver Reportes en el Mapa
                            Container(
                              width: 340,
                              height: 84,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 22,
                              ),
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: SizedBox(),
                                  ), // Espacio vacío a la izquierda
                                  // Texto alineado a la derecha
                                  SizedBox(
                                    width: 146,
                                    child: Text(
                                      'Ver Reportes\nen el Mapa',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Separador
                            const SizedBox(height: 10),

                            // Contenedor 2 - Ver Reportes Atendidos
                            Container(
                              width: 340,
                              height: 84,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 22,
                              ),
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: SizedBox(),
                                  ), // Espacio vacío a la izquierda
                                  // Texto alineado a la derecha
                                  SizedBox(
                                    width: 146,
                                    child: Text(
                                      'Ver Reportes\nAtendidos',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Separador
                            const SizedBox(height: 10),

                            // Contenedor 3 - Recomendaciones
                            Container(
                              width: 340,
                              height: 84,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 22,
                              ),
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: SizedBox(),
                                  ), // Espacio vacío a la izquierda
                                  // Texto alineado a la derecha
                                  SizedBox(
                                    width: 146,
                                    child: Text(
                                      'Recomendaciones',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Contenedor negro a la derecha
                    Expanded(
                      flex: 1100,
                      child: Container(
                        height: 790,
                        color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Contenedor superior - "Reporte de Residuos"
                            Container(
                              width: 387,
                              height: 110,
                              alignment: Alignment.center,
                              child: Text(
                                'Reporte de Residuos',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),

                            // Espacio entre contenedores
                            const SizedBox(height: 20),

                            // Tres pasos horizontales
                            Container(
                              width: 784,
                              height: 62,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  // Paso 1: Indique su ubicación
                                  Expanded(
                                    flex: 261,
                                    child: Container(
                                      height: 62,
                                      color: const Color(
                                        0xFF00FF9C,
                                      ), // Verde claro
                                      alignment: Alignment.center,
                                      child: Text(
                                        '1. Indique su ubicación',
                                        style: TextStyle(
                                          fontFamily: 'PT Sans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Paso 2: Proporcione detalles
                                  Expanded(
                                    flex: 261,
                                    child: Container(
                                      height: 62,
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Text(
                                        '2. Proporcione detalles',
                                        style: TextStyle(
                                          fontFamily: 'PT Sans',
                                          fontSize: 21,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Paso 3: Confirmación de envío
                                  Expanded(
                                    flex: 261,
                                    child: Container(
                                      height: 62,
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Text(
                                        '3. Confirmación de envío',
                                        style: TextStyle(
                                          fontFamily: 'PT Sans',
                                          fontSize: 21,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Espacio vertical
                            const SizedBox(height: 10),

                            // Contenedor grande de 1100 x 500
                            Container(
                              width: 1100,
                              height: 490,
                              color: Colors.black,
                              child: Center(
                                child: Container(), // Vacío por ahora
                              ),
                            ),

                            // Espacio vertical
                            const SizedBox(height: 10),

                            // Botones "Salir" y "Continuar"
                            Container(
                              width: 1100,
                              height: 80,
                              color: Colors.black,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Botón Salir
                                  Container(
                                    width: 261,
                                    height: 62,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF00FFFF,
                                      ), // Azul claro
                                      borderRadius: BorderRadius.circular(
                                        11.59,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Salir',
                                      style: TextStyle(
                                        fontFamily: 'PT Sans',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 110,
                                  ), // Espacio entre botones
                                  // Botón Continuar
                                  Container(
                                    width: 261,
                                    height: 62,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF00FFFF,
                                      ), // Azul claro
                                      borderRadius: BorderRadius.circular(
                                        11.59,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Continuar',
                                      style: TextStyle(
                                        fontFamily: 'PT Sans',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
