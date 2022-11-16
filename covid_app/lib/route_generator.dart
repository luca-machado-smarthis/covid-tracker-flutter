import 'package:covid_app/components/satstistics.dart';
import 'package:covid_app/pages/allCountries.dart';
import 'package:covid_app/pages/brasil.dart';
import 'package:covid_app/pages/dateSearch.dart';
import 'package:covid_app/pages/brasilEstados.dart';
import 'package:covid_app/pages/home.dart';
import 'package:covid_app/pages/paisesFiltro.dart';
import 'package:covid_app/pages/statisticsPage.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: ((context) => Home()));
      case '/brasil':
        return MaterialPageRoute(builder: ((context) => Brasil()));
      case '/brasil/estados':
        return MaterialPageRoute(builder: ((context) => BrasilEstados()));
      case '/brasil/data':
        return MaterialPageRoute(builder: ((context) => DateSearch()));
      case '/statisticsCountry':
        return MaterialPageRoute(builder: ((context) => StatisticPage(args: args)));
      case '/paises-filtro':
        return MaterialPageRoute(builder: ((context) => CountriesFilter()));
      case '/paises-all':
        return MaterialPageRoute(builder: ((context) => AllCountries()));
      default:
        return MaterialPageRoute(builder: ((context) => Home()));
    }
  }
}