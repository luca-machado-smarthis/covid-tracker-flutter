import 'package:covid_app/components/satstistics.dart';
import 'package:flutter/material.dart';



class CountriesFilter extends StatefulWidget {
  const CountriesFilter({super.key});

  @override
  State<CountriesFilter> createState() => _CountriesFilterState();
}

class _CountriesFilterState extends State<CountriesFilter> {
  late List<DropdownMenuItem<String>> _stateItems;
  late String? _selectedCountry;
  late dynamic _statistics;

  @override
  void initState() {
    List<String> countries = [
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
  'Sierra Leone','Singapore',
  'Slovakia',
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
];;

    _stateItems = countries.map<DropdownMenuItem<String>>(
      (String countryOption) {
        return DropdownMenuItem<String>(
          value: countryOption,
          child: Text(countryOption),
        );
      },
    ).toList();

    _selectedCountry = countries[0];
    _statistics = Center(
      child: const Text(
        'Escolha o país acima', 
        style: TextStyle(fontSize: 24),));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CovidT - Busca por país'),
        backgroundColor: Color.fromARGB(255, 231, 27, 170),
        ),
      body: ListView(children: [
        Container(
          child: DropdownButton<String>(
            items: _stateItems,
            value: _selectedCountry,
            onChanged: (newValue) => {
              _selectedCountry = newValue,
              _statistics = Statistics(args: '/${_selectedCountry}'),
              setState(() {})
            },
          ),
        ),
        _statistics,
      ]),
    );
  }
}
