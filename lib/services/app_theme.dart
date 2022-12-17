import 'package:flutter/material.dart';

 
class AppTheme{
  static final appThemeData={
    AppTheme.darkTheme:ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white)
        )
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white)
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.grey,unselectedItemColor: Colors.black
      )
    ),
    AppTheme.lightTheme:ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: const Color(0xFF757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black)
        )
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.black)
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white
      )
     ),

  };

  static var darkTheme;

  static var lightTheme;
}
// ThemeData _darkTheme = ThemeData(
//               accentColor: Colors.red,
//               brightness: Brightness.dark,
//               primaryColor: Colors.amber,
            
//             );
            
//             ThemeData _lightTheme = ThemeData(
//               accentColor: Colors.pink,
//               brightness: Brightness.light,
//               primaryColor: Colors.blue
//             );