import 'package:covid_app/components/satstistics%20copy.dart';
import 'package:covid_app/pages/statisticsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        title: Text('CovidT - Todos os países'),
        backgroundColor: Color.fromARGB(255, 102, 74, 181),
        ),
      body: StatisticsList(args: 'countries'),
      );
      }
}