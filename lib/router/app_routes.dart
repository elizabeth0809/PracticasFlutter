import 'package:flutter/material.dart';

import '../models/models.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'Home';
  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'listview1',
        name: 'list view 1',
        screen: Listview1Screen(),
        icon: Icons.access_alarm_rounded),
    MenuOption(
        route: 'listview2',
        name: 'list view 2',
        screen: Listview2Screen(),
        icon: Icons.accessibility_new_outlined),
    MenuOption(
        route: 'alert',
        name: 'alertas',
        screen: AlertScreen(),
        icon: Icons.battery_full_sharp),
    MenuOption(
        route: 'card',
        name: 'Tarjetas',
        screen: CardScreen(),
        icon: Icons.tab_outlined),
    MenuOption(
        route: 'avatar',
        name: 'Avatar',
        screen: AvatarScreen(),
        icon: Icons.supervised_user_circle),
    MenuOption(
        route: 'animated',
        name: 'Animated Container',
        screen: AnimatedScreen(),
        icon: Icons.auto_fix_normal_outlined),
    MenuOption(
        route: 'inputs',
        name: 'Text Inputs',
        screen: InputsScreen(),
        icon: Icons.input),
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'Home': (BuildContext context) => const HomeScreen()});
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  /*static Map<String, Widget Function(BuildContext)> routes = {
    'Home': (BuildContext context) => const HomeScreen(),
    'listview1': (BuildContext context) => const Listview1Screen(),
    'listview2': (BuildContext context) => const Listview2Screen(),
    'alert': (BuildContext context) => const AlertScreen(),
    'card': (BuildContext context) => const CardScreen(),
  };*/
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
