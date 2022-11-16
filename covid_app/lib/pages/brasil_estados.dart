import 'package:covid_app/components/statistics.dart';
import 'package:flutter/material.dart';

class StateOption {
  final String state;
  final String uf;

  StateOption(this.state, this.uf);

  static List<StateOption> get allStates => [
        StateOption('Acre', 'AC'),
        StateOption('Alagoas', 'AL'),
        StateOption('Amapá', 'AP'),
        StateOption('Amazonas', 'AM'),
        StateOption('Bahia', 'BA'),
        StateOption('Ceará', 'CE'),
        StateOption('Distrito Federal', 'DF'),
        StateOption('Espírito Santo', 'ES'),
        StateOption('Goiás', 'GO'),
        StateOption('Maranhão', 'MA'),
        StateOption('Mato Grosso', 'MT'),
        StateOption('Mato Grosso do Sul', 'MS'),
        StateOption('Minas Gerais', 'MG'),
        StateOption('Pará', 'PA'),
        StateOption('Paraíba', 'PB'),
        StateOption('Paraná', 'PR'),
        StateOption('Pernambuco', 'PE'),
        StateOption('Piauí', 'PI'),
        StateOption('Rio de Janeiro', 'RJ'),
        StateOption('Rio Grande do Norte', 'RN'),
        StateOption('Rio Grande do Sul', 'RS'),
        StateOption('Rondônia', 'RO'),
        StateOption('Roraima', 'RR'),
        StateOption('Santa Catarina', 'SC'),
        StateOption('São Paulo', 'SP'),
        StateOption('Sergipe', 'SE'),
        StateOption('Tocantins', 'TO'),
      ];
}

class BrasilEstados extends StatefulWidget {
  const BrasilEstados({super.key});

  @override
  State<BrasilEstados> createState() => _BrasilEstadosState();
}

class _BrasilEstadosState extends State<BrasilEstados> {
  late List<DropdownMenuItem<StateOption>> _stateItems;
  late StateOption? _selectedState;
  late dynamic _statistics;
  late dynamic uga;
  bool _selectedDisplay = false;

  @override
  void initState() {
    List<StateOption> states = StateOption.allStates;

    _stateItems = states.map<DropdownMenuItem<StateOption>>(
      (StateOption stateOption) {
        return DropdownMenuItem<StateOption>(
          value: stateOption,
          child: Text(stateOption.state),
        );
      },
    ).toList();

    _selectedState = states[0];
    _statistics = const Text('');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('CovidT - Busca por estado'),
          backgroundColor: const Color.fromARGB(255, 56, 226, 56)),
      body: ListView(children: [
          DropdownButton<StateOption>(
            items: _stateItems,
            value: _selectedState,
            onChanged: (newValue) => {
              _selectedState = newValue,
              _statistics = Statistics(args: 'brazil/uf/${_selectedState?.uf}'),
              _selectedDisplay = true,
              setState(() {})
            },
          ),
        _statistics,
        Text(
          (_selectedDisplay? '' : 'selecione seu estado acima'),
          style: const TextStyle(fontSize: 24),
        ),
      ]),
    );
  }
}
