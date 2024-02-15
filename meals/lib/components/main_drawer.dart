import 'package:flutter/material.dart';
import 'package:meals/utils/app_routs.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  _creatItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap as void Function()?,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.amber,
            alignment: Alignment.bottomRight,
            child: Text('Vamos cozinhar?',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          SizedBox(height: 20),
          _creatItem(
            Icons.restaurant,
            'Refeições',
            () => Navigator.of(context).pushReplacementNamed(AppRouts.HOME),
          ),
          _creatItem(
            Icons.settings,
            'Configurações',
            () => Navigator.of(context).pushReplacementNamed(AppRouts.SETTINGS),
          ),
        ],
      ),
    );
  }
}
