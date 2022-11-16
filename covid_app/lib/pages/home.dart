import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Text('CovidT'),
      backgroundColor: Color.fromARGB(255, 70, 70, 70)
        ),
      body: Center(
        child: Column(children: [
        Container(
          width: 200,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(2),
          child: OutlinedButton(
          onPressed: (() {
              Navigator.of(context).pushNamed(
                '/brasil',
              );
            }),
           child: Text('Brasil')
           ),
      ),
    Container(
      width: 200,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(2),
      child: OutlinedButton(
      onPressed: (() {
        Navigator.of(context).pushNamed(
          '/paises-all',
        );
      }),
      child: Text('Todos os Países')
      ),
    ) ,
    Container(
      width: 200,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(2),
      child: OutlinedButton(
      onPressed: (() {
        Navigator.of(context).pushNamed(
          '/paises-filtro',
        );
      }),
      child: Text('Consultar por País')
      ),
    )  
      ])),
        );
  }
}