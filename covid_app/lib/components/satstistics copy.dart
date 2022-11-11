import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  String updated_at;

  CasePais(
      {required this.place,
      this.cases,
      this.confirmed,
      this.deaths,
      this.suspected,
      this.recovered,
      required this.updated_at});

  factory CasePais.fromJson(Map<String, dynamic> json) {
    json = (json['data'] != null)? json['data'] : json;

    return CasePais(
      place: (json['country']!= null) ? json['country']:json['state'],
      cases: (json['cases'] != null) ? json['cases'] : 0,
      confirmed: (json['confirmed'] != null) ? json['confirmed'] : 0,
      deaths: (json['deaths'] != null) ? json['deaths'] : 0,
      suspected: (json['suspected'] != null) ? json['suspected'] : 0,
      recovered: (json['recovered'] != null) ? json['recovered'] : 0,
      updated_at: (json['updated_at'] != null) ? json['updated_at'] : json['datetime'],
    );
  }
}

class Result{
  final List<CasePais> data;

  Result({required this.data})

  factory Result.fromjson(Map<String, dynamic> json){
    var list = json['data'] as List;
    List<CasePais> resultsList = list.map((i) => CasePais.fromJson(i)).toList();
    
    return Result(data: resultsList);
  }

}

Future<CasePais> apiCall(dynamic args) async {
  var url = Uri.https("covid19-brazil-api.now.sh", "/api/report/v1/${args}");
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
              children: []
            ));
          }

          return CircularProgressIndicator();
        });
  }
}
