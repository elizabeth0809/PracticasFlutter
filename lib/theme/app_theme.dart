import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  static const Color iconos = Colors.amber;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.amber,

      //AppBar
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primary),
      ),
      //Boton flotante
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 5),
      //boton elevado
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: Colors.indigo, shape: const StadiumBorder(), elevation: 0),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          //cuando el el foco lo tiene el input
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)))));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.indigo,
      //AppBar
      appBarTheme: const AppBarTheme(color: iconos, elevation: 0));
}
