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
      title: const Text('CovidT'),
      backgroundColor: const Color.fromARGB(255, 70, 70, 70)
        ),
      body: Center(
        child: Column(children: [
        Container(
          width: 200,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(2),
          child: OutlinedButton(
          onPressed: (() {
              Navigator.of(context).pushNamed(
                '/brasil',
              );
            }),
           child: const Text('Brasil')
           ),
      ),
    Container(
      width: 200,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(2),
      child: OutlinedButton(
      onPressed: (() {
        Navigator.of(context).pushNamed(
          '/paises-all',
        );
      }),
      child: const Text('Todos os Países')
      ),
    ) ,
    Container(
      width: 200,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(2),
      child: OutlinedButton(
      onPressed: (() {
        Navigator.of(context).pushNamed(
          '/paises-filtro',
        );
      }),
      child: const Text('Consultar por País')
      ),
    )  
      ])),
        );
  }
}