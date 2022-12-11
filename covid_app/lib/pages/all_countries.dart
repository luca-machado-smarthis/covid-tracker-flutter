import 'package:covid_app/components/statistics_list.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  const AllCountries({super.key});

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CovidT - Todos os países'),
        backgroundColor: const Color.fromARGB(255, 102, 74, 181),
        ),
      body: const StatisticsList(args: 'countries'),
      );
      }
}