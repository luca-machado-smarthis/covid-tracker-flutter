import 'package:covid_app/pages/brasilEstados.dart';
import 'package:covid_app/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/components/satstistics.dart';

void main() {
  runApp(MaterialApp(
    title: "Navegação",
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
