import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';

class CasePais {
  String place = '';
  int? cases;
  int? confirmed;
  int? deaths;
  int? suspected;
  int? recovered;
  // ignore: non_constant_identifier_names
  String updated_at;

  CasePais(
      {required this.place,
      this.cases,
      this.confirmed,
      this.deaths,
      this.suspected,
      this.recovered,
      // ignore: non_constant_identifier_names
      required this.updated_at});

  factory CasePais.fromJson(Map<String, dynamic> json) {
    json = (json['data'] != null) ? json['data'] : json;

    return CasePais(
      place: (json['country'] != null) ? json['country'] : json['state'],
      cases: (json['cases'] != null) ? json['cases'] : 0,
      confirmed: (json['confirmed'] != null) ? json['confirmed'] : 0,
      deaths: (json['deaths'] != null) ? json['deaths'] : 0,
      suspected: (json['suspected'] != null) ? json['suspected'] : 0,
      recovered: (json['recovered'] != null) ? json['recovered'] : 0,
      updated_at:
          (json['updated_at'] != null) ? json['updated_at'] : json['datetime'],
    );
  }
}

Future<CasePais> apiCall(dynamic args) async {
  var url = Uri.https("covid19-brazil-api.now.sh", "/api/report/v1/$args");
  var response = await http.get(url);
  return CasePais.fromJson(jsonDecode(response.body));
}

class Statistics extends StatefulWidget {
  final dynamic args;

  const Statistics({super.key, required this.args});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  Future<CasePais>? futureCasePais;

  @override
  void initState() {
    super.initState();
    futureCasePais = apiCall(widget.args);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      futureCasePais = apiCall(widget.args);
    });

    return FutureBuilder<CasePais>(
        future: futureCasePais,
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (snapshot.hasData && data != null) {
            return Center(
                child: Column(
              children: [
                Center(
                    child: Text(
                  data.place,
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color:const Color.fromARGB(255, 229, 239, 155)),
                      borderRadius: BorderRadius.circular(8)),
                  width: 850,
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text('Casos Totais',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset('images/abacus-svgrepo-com.svg',
                                color:const Color.fromARGB(255, 229, 239, 155),
                                width: 50.0,
                                semanticsLabel: 'A red up arrow'),
                            Text('${data.confirmed}')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: const Color.fromARGB(255, 213, 215, 76)),
                      borderRadius: BorderRadius.circular(8)),
                  width: 850,
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text('Casos Confirmados',
                          style: TextStyle(
                              fontSize:  28, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                                'images/person-question-mark-svgrepo-com.svg',
                                color: const Color.fromARGB(255, 213, 215, 76),
                                width: 50.0,
                                semanticsLabel: 'A red up arrow'),
                            Text('${data.confirmed}')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: const Color.fromARGB(255, 225, 109, 59)),
                      borderRadius: BorderRadius.circular(8)),
                  width: 850,
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text('Casos suspeitos',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                                'images/hospital-user-svgrepo-com.svg',
                                color: const Color.fromARGB(255, 225, 109, 59),
                                width: 50.0,
                                semanticsLabel: 'A red up arrow'),
                            Text('${data.suspected}')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: const Color.fromARGB(255, 225, 31, 31)),
                      borderRadius: BorderRadius.circular(8)),
                  width: 850,
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text('Mortes',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                              'images/death-alt2-svgrepo-com.svg',
                              color: const Color.fromARGB(255, 225, 31, 31),
                              width: 50.0,
                            ),
                            Text('${data.deaths}')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: const Color.fromARGB(255, 123, 235, 62)),
                      borderRadius: BorderRadius.circular(8)),
                  width: 850,
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text('Recuperados',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                                'images/health-care-svgrepo-com.svg',
                                color: const Color.fromARGB(255, 123, 235, 62),
                                width: 50.0,
                                semanticsLabel: 'A red up arrow'),
                            Text('${data.recovered}')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ));
          }

          return const CircularProgressIndicator();
        });
  }
}
