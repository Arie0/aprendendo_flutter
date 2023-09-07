import 'package:aprendendo_flutter/theme/my_colors.dart';
import 'package:flutter/material.dart';

class My_theme {
  static final lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
      primaryColor: my_colors.primaryColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 188, 128, 199),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color.fromARGB(255, 156, 156, 156),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            my_colors.primaryColor,
          ),
          textStyle: MaterialStatePropertyAll(
            TextStyle(color: my_colors.primaryColor),
          ),
        ),
      ),
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(
                  TextStyle(color: my_colors.textLight)))));

  static final darkTheme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.purple,
    ),
  );
}
