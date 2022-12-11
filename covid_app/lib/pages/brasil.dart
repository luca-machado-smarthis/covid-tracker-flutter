import 'package:flutter/material.dart';

class Brasil extends StatefulWidget {
  const Brasil({super.key});

  @override
  State<Brasil> createState() => _BrasilState();
}

class _BrasilState extends State<Brasil> {
  final String _place = 'brazil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('CovidT - Brasil'),
        backgroundColor: const Color.fromARGB(255, 56, 226, 56),
        ),
      body: Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Container(
        width: 200,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(2),
          child: OutlinedButton(
          onPressed: (() {
              Navigator.of(context).pushNamed(
                '/statisticsCountry',
                arguments: _place,
              );
            }),
           child: const Text('Brasil Geral')
           ),
      ),
    Container(
      width: 200,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(2),
      child: OutlinedButton(
      onPressed: (() {
        Navigator.of(context).pushNamed(
          '/brasil/estados',
          arguments: 'brazil'
        );
      }),
      child: const Text('Consulta por estado')
      ),
    ) ,
    Container(
      width: 200,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(2),
      child: OutlinedButton(
      onPressed: (() {
        Navigator.of(context).pushNamed(
          '/brasil/data'
        );
      }),
      child: const Text('Consultar por Data')
      ),
    )  
      ])),
        );
  }
}