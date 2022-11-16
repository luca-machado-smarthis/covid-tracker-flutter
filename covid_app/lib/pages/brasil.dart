import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Brasil extends StatefulWidget {
  const Brasil({super.key});

  @override
  State<Brasil> createState() => _BrasilState();
}

class _BrasilState extends State<Brasil> {
  String? _date;
  String _place = 'brazil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('CovidT - Brasil'),
        backgroundColor: Color.fromARGB(255, 56, 226, 56),
        ),
      body: Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Container(
        width: 200,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(2),
          child: OutlinedButton(
          onPressed: (() {
              Navigator.of(context).pushNamed(
                '/statisticsCountry',
                arguments: _place,
              );
            }),
           child: Text('Brasil Geral')
           ),
      ),
    Container(
      width: 200,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(2),
      child: OutlinedButton(
      onPressed: (() {
        Navigator.of(context).pushNamed(
          '/brasil/estados',
          arguments: 'brazil'
        );
      }),
      child: Text('Consulta por estado')
      ),
    ) ,
    Container(
      width: 200,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(2),
      child: OutlinedButton(
      onPressed: (() {
        Navigator.of(context).pushNamed(
          '/brasil/data'
        );
      }),
      child: Text('Consultar por Data')
      ),
    )  
      ])),
        );
  }
}