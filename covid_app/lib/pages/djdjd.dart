// import 'package:flutter/material.dart';

// class CountriesButton extends StatefulWidget {
//   const CountriesButton({Key key}) : super(key: key);

//   @override
//   _CountriesButtonState createState() => _CountriesButtonState();
// }

// class _CountriesButtonState extends State<CountriesButton> {
//   List<DropdownMenuItem<CountryOption>> _countryItems;
//   CountryOption _selectedCountry;

//   @override
//   void initState() {
//     // Get all countries
//     List<CountryOption> countries = CountryOption.allCountries;

//     // Initialise your items only once
//     _countryItems = countries.map<DropdownMenuItem<CountryOption>>(
//       (CountryOption countryOption) {
//         return DropdownMenuItem<CountryOption>(
//           value: countryOption,
//           child: Text(countryOption.fullName),
//         );
//       },
//     ).toList();

//     // Initialiste your dropdown with the first country in the list
//     // (might be different in your specific scenario)
//     _selectedCountry = countries[0];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: DropdownButton<CountryOption>(
//         isExpanded: true,
//         underline: SizedBox(),
//         icon: SvgPicture.asset("assets/icons/dropdown.svg"),
//         value: _selectedCountry,
//         items: _countryItems,
//         onChanged: (newValue) {
//           setState(() {
//             _selectedCountry = newValue;
//           });
//           },
//       ),
//     );
//   }
// }

// class CountryOption {
//   final String key;
//   final String fullName;

//   CountryOption(this.key, this.fullName);

//   static List<CountryOption> get allCountries => [
//         CountryOption('nepal', 'Nepal'),
//         CountryOption('india', 'India'),
//         CountryOption('USA', 'United States'),
//         CountryOption('denmark', 'Denmark'),
//         CountryOption('uk', 'UK'),
//         CountryOption('world', 'World Wide'),
//       ];
// }

//----------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class CasePais {
//   String country;
//   int? cases;
//   int? confirmed;
//   int? deaths;
//   int? suspected;
//   int? recovered;
//   String updated_at;

//   CasePais(
//       {required this.country,
//       this.cases,
//       this.confirmed,
//       this.deaths,
//       this.suspected,
//       this.recovered,
//       required this.updated_at});

//   factory CasePais.fromJson(Map<String, dynamic> json) {
//     json = json['data'];

//     return CasePais(
//       country: json['country'],
//       cases: (json['cases'] != null) ? json['cases'] : 0,
//       confirmed: (json['confirmed'] != null) ? json['confirmed'] : 0,
//       deaths: (json['deaths'] != null) ? json['deaths'] : 0,
//       suspected: (json['suspected'] != null) ? json['suspected'] : 0,
//       recovered: (json['recovered'] != null) ? json['recovered'] : 0,
//       updated_at: json['updated_at'],
//     );
//   }
// }

// Future<CasePais> apiCall(dynamic args) async {
//   var url = Uri.https("covid19-brazil-api.now.sh", "/api/report/v1/${args}");
//   var response = await http.get(url);
//   return CasePais.fromJson(jsonDecode(response.body));
// }

// class Statistics extends StatefulWidget {
//   final dynamic args;

//   const Statistics({super.key, required this.args});

//   @override
//   State<Statistics> createState() => _StatisticsState();
// }

// class _StatisticsState extends State<Statistics> {
//   Future<CasePais>? futureCasePais;

//   @override
//   void initState() {
//     super.initState();
//     futureCasePais = apiCall('brazil');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('Covid Tracker'),
//           backgroundColor: Color.fromARGB(255, 70, 70, 70)),
//       body: FutureBuilder<CasePais>(
//           future: futureCasePais,
//           builder: (context, snapshot) {
//             var data = snapshot.data;
//             if (snapshot.hasData && data!=null) {
//               return Column(
//                 children: [
//                   Container(
//                     child: Text('cases ${data.cases}'),
//                   ),
//                   Container(
//                     child: Text('suspected cases ${data.suspected}'),
//                   ),
//                   Container(
//                     child: Text('confirmed cases ${data.confirmed}'),
//                   ),
//                   Container(
//                     child: Text('deaths ${data.deaths}'),
//                   ),
//                   Container(
//                     child: Text('recovered ${data.recovered}'),
//                   ),
//                 ],
//               );
//             }

//             return CircularProgressIndicator();
//           }),
//     );
//   }
// }

var list = [
  'Afghanistan',
  'Albania',
  'Algeria',
  'Andorra',
  'Angola',
  'Antarctica',
  'Antigua and Barbuda',
  'Argentina',
  'Armenia',
  'Australia',
  'Austria',
  'Azerbaijan',
  'Bahamas',
  'Bahrain',
  'Bangladesh',
  'Barbados',
  'Belarus',
  'Belgium',
  'Belize',
  'Benin',
  'Bhutan',
  'Bolivia',
  'Bosnia and Herzegovina',
  'Botswana',
  'Brazil',
  'Brunei',
  'Bulgaria',
  'Burkina Faso',
  'Burma',
  'Burundi',
  'Cabo Verde',
  'Cambodia',
  'Cameroon',
  'Canada',
  'Central African Republic',
  'Chad',
  'Chile',
  'China',
  'Colombia',
  'Comoros',
  'Congo (Brazzaville)',
  'Congo (Kinshasa)',
  'Costa Rica',
  "Cote d'Ivoire",
  'Croatia',
  'Cuba',
  'Cyprus',
  'Czechia',
  'Denmark',
  'Diamond Princess',
  'Djibouti',
  'Dominica',
  'Dominican Republic',
  'Ecuador',
  'Egypt',
  'El Salvador',
  'Equatorial Guinea',
  'Eritrea',
  'Estonia',
  'Eswatini',
  'Ethiopia',
  'Fiji',
  'Finland',
  'France',
  'Gabon',
  'Gambia',
  'Georgia',
  'Germany',
  'Ghana',
  'Greece',
  'Grenada',
  'Guatemala',
  'Guinea',
  'Guinea-Bissau',
  'Guyana',
  'Haiti',
  'Holy See',
  'Honduras',
  'Hungary',
  'Iceland',
  'India',
  'Indonesia',
  'Iran',
  'Iraq',
  'Ireland',
  'Israel',
  'Italy',
  'Jamaica',
  'Japan',
  'Jordan',
  'Kazakhstan',
  'Kenya',
  'Kiribati',
  'Korea, North',
  'Korea, South',
  'Kosovo',
  'Kuwait',
  'Kyrgyzstan',
  'Laos',
  'Latvia',
  'Lebanon',
  'Lesotho',
  'Liberia',
  'Libya',
  'Liechtenstein',
  'Lithuania',
  'Luxembourg',
  'MS Zaandam',
  'Madagascar',
  'Malawi',
  'Malaysia',
  'Maldives',
  'Mali',
  'Malta',
  'Marshall Islands',
  'Mauritania',
  'Mauritius',
  'Mexico',
  'Micronesia',
  'Moldova',
  'Monaco',
  'Mongolia',
  'Montenegro',
  'Morocco',
  'Mozambique',
  'Namibia',
  'Nauru',
  'Nepal',
  'Netherlands',
  'New Zealand',
  'Nicaragua',
  'Niger',
  'Nigeria',
  'North Macedonia',
  'Norway',
  'Oman',
  'Pakistan',
  'Palau',
  'Panama',
  'Papua New Guinea',
  'Paraguay',
  'Peru',
  'Philippines',
  'Poland',
  'Portugal',
  'Qatar',
  'Romania',
  'Russia',
  'Rwanda',
  'Saint Kitts and Nevis',
  'Saint Lucia',
  'Saint Vincent and the Grenadines',
  'Samoa',
  'San Marino',
  'Sao Tome and Principe',
  'Saudi Arabia',
  'Senegal',
  'Serbia',
  'Seychelles',
  'Sierra Leone','Singapore',            'Slovakia',
  'Slovenia',             'Solomon Islands',
  'Somalia',              'South Africa',
  'South Sudan',          'Spain',
  'Sri Lanka',            'Sudan',
  'Summer Olympics 2020', 'Suriname',
  'Sweden',               'Switzerland',
  'Syria',                'Taiwan*',
  'Tajikistan',           'Tanzania',
  'Thailand',             'Timor-Leste',
  'Togo',                 'Tonga',
  'Trinidad and Tobago',  'Tunisia',
  'Turkey',               'Tuvalu',
  'US',                   'Uganda',
  'Ukraine',              'United Arab Emirates',
  'United Kingdom',       'Uruguay',
  'Uzbekistan',           'Vanuatu',
  'Venezuela',            'Vietnam',
  'West Bank and Gaza',   'Winter Olympics 2022',
  'Yemen',                'Zambia',
  'Zimbabwe'
];
