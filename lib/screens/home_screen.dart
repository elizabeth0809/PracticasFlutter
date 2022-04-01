import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/menu_option.dart';
import 'package:flutter_application_1/screens/screens.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

import '../router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en flutter'),
        elevation: 0,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(menuOptions[index].icon, color: AppTheme.iconos),
          title: Text(menuOptions[index].name),
          onTap: () {
            //final route = MaterialPageRoute(
            //  builder: (context) => Listview1Screen(),
            // );
            //Navigator.pushReplacement(context, route); esto destruye
            Navigator.pushNamed(context, menuOptions[index].route);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: menuOptions.length,
      ),
    );
  }
}
