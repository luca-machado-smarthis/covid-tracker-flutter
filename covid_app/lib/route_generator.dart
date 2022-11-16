import 'package:covid_app/pages/all_countries.dart';
import 'package:covid_app/pages/brasil.dart';
import 'package:covid_app/pages/date_search.dart';
import 'package:covid_app/pages/brasil_estados.dart';
import 'package:covid_app/pages/home.dart';
import 'package:covid_app/pages/paises_filtro.dart';
import 'package:covid_app/pages/statistics_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: ((context) => const Home()));
      case '/brasil':
        return MaterialPageRoute(builder: ((context) => const Brasil()));
      case '/brasil/estados':
        return MaterialPageRoute(builder: ((context) => const BrasilEstados()));
      case '/brasil/data':
        return MaterialPageRoute(builder: ((context) => const DateSearch()));
      case '/statisticsCountry':
        return MaterialPageRoute(builder: ((context) => StatisticPage(args: args)));
      case '/paises-filtro':
        return MaterialPageRoute(builder: ((context) => const CountriesFilter()));
      case '/paises-all':
        return MaterialPageRoute(builder: ((context) => const AllCountries()));
      default:
        return MaterialPageRoute(builder: ((context) => const Home()));
    }
  }
}