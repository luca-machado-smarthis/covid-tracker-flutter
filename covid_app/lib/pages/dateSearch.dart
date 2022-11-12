import 'package:covid_app/components/satstistics%20copy.dart';
import 'package:covid_app/components/satstistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class DateSearch extends StatefulWidget {
  const DateSearch({super.key});

  @override
  State<DateSearch> createState() => _DateSearchState();
}

class _DateSearchState extends State<DateSearch> {
  late dynamic _dateTime;
  dynamic _statistics;

  @override
  void initState() {
    _dateTime = DateTime.now();
    _statistics = Text('escolha uma data');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Busca por estado')),
      body: Column(children: [
        ElevatedButton(
          child: Text('Escolha uma data'),
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: DateTime.utc(2020, 2, 26),
                    lastDate: DateTime.now())
                .then((date) {
              setState(() {
                _dateTime = date;
                String converted =
                    '${date?.year.toString()}${(date?.month.toString())?.length == 2 ? date?.month.toString() : '0${date?.month.toString()}'}${(date?.day.toString())?.length == 2 ? date?.day.toString() : '0${date?.day.toString()}'}';
                //todo criar pagina especifica pros estados
                _statistics = StatisticsList(args: 'brazil/$converted');
              });
            });
          },
        ),
        SizedBox(
          height: 400,
          child: _statistics,
        ),
      ]),
    );
  }
}
