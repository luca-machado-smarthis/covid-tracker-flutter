import 'package:covid_app/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Navegação",
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
