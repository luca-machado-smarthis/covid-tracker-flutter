import 'package:covid_app/components/satstistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatisticPage extends StatefulWidget {
  final dynamic args;

  const StatisticPage({super.key, this.args});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CovidT ${widget.args}'),
          backgroundColor: Color.fromARGB(255, 56, 226, 56)
        ),
        body: ListView(
          children: [
            Statistics(args: widget.args),
          ],
        ));
  }
}
