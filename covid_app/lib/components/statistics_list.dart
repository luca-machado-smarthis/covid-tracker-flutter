import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class Result {
  final List<CasePais> data;

  Result({required this.data});

  factory Result.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<CasePais> resultsList = list.map((i) => CasePais.fromJson(i)).toList();

    return Result(data: resultsList);
  }
}

Future<Result> apiCall(dynamic args) async {
  var url = Uri.https("covid19-brazil-api.now.sh", "/api/report/v1/$args");
  var response = await http.get(url);
  return Result.fromJson(jsonDecode(response.body));
}

class StatisticsList extends StatefulWidget {
  final dynamic args;

  const StatisticsList({super.key, required this.args});

  @override
  State<StatisticsList> createState() => _StatisticsListState();
}

class _StatisticsListState extends State<StatisticsList> {
  Future<Result>? futureCasePais;

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

    return FutureBuilder<Result>(
        future: futureCasePais,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            List<CasePais> cards = List.generate(data!.data.length, (idx) {
              var idxData = data.data[idx];

              return CasePais(
                  place: idxData.place,
                  cases: idxData.cases,
                  confirmed: idxData.confirmed,
                  deaths: idxData.deaths,
                  suspected: idxData.suspected,
                  recovered: idxData.recovered,
                  updated_at: idxData.updated_at);
            });
            return ListView(
              children: cards.map((info) => card(info)).toList(),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

Widget card(info) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(width: 2, color: const Color.fromARGB(255, 229, 239, 155)),
        borderRadius: BorderRadius.circular(8)),
    width: 450,
    margin: const EdgeInsets.all(16),
    child: Column(
      children: [
        Text('${info.place}',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.black,decoration: TextDecoration.none)),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Confirmado: ${info.confirmed}', style: const TextStyle(fontSize: 16, color: Colors.black,decoration: TextDecoration.none, fontWeight: FontWeight.normal),),
              Text('Morte: ${info.deaths}', style: const TextStyle(fontSize: 16, color: Colors.black,decoration: TextDecoration.none, fontWeight: FontWeight.normal)),
            ],
          ),
        )
      ],
    ),
  );
}


// if (snapshot.hasData) {
//                 List<Post> posts = List<Post>();
//                 for (int i = 0; i < snapshot.data.count - 1; i++) {
//                   posts.add(
//                     Post(
//                       posts: [
//                         Result(
//                           id: snapshot.data.posts[i].id,
//                           title: snapshot.data.posts[i].title,
//                           content: snapshot.data.posts[i].content,
//                           author: snapshot.data.posts[i].author,
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//                 return ListView(
//                   children:
//                       posts.map((post) => postTemplate(post.posts[0])).toList(),
//                 );
//               return CircularProgressIndicator();
//               } 
//             }