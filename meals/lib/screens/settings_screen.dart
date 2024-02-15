import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(
      {super.key, required this.onSettingsChanged, required this.settings});

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  _creatSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Configurações',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _creatSwitch(
                'Sem Glúten',
                'Só exibe refeições sem glúten!',
                settings.isGlutenFree,
                (value) => setState(() {
                  settings.isGlutenFree = value;
                }),
              ),
              _creatSwitch(
                'Sem Lactose',
                'Só exibe refeições sem Lactose!',
                settings.isLactoseFree,
                (value) => setState(() {
                  settings.isLactoseFree = value;
                }),
              ),
              _creatSwitch(
                'Vegetariana',
                'Só exibe refeições vegetarianas!',
                settings.isVegetarian,
                (value) => setState(() {
                  settings.isVegetarian = value;
                }),
              ),
              _creatSwitch(
                'Vegana',
                'Só exibe refeições veganas!',
                settings.isVegan,
                (value) => setState(() {
                  settings.isVegan = value;
                }),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
