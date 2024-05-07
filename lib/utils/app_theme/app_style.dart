import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.blue,
  // bottomAppBarColor: kWhiteColor,
  dividerColor: Colors.grey,
  disabledColor: Colors.grey,
  indicatorColor: Colors.grey,
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.blue),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    height: 33,
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)), side: BorderSide(color: Colors.blue)),
    alignedDropdown: false,
    buttonColor: Colors.blue,
    disabledColor: Colors.grey,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
  ),
  //text theme which contains all text styles
  textTheme: const TextTheme().copyWith(
//  TextTheme(
//    //text style of 'Delivering almost everything' at phone_number page
    bodyLarge: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.3,
    ),
    bodyMedium: const TextStyle(
      fontSize: 16,
      letterSpacing: 1.0,
    ),
    labelLarge: const TextStyle(
      fontSize: 13.3,
      letterSpacing: 1.0,
    ),
    headlineMedium: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16.7,
    ),
    titleLarge: const TextStyle(
      color: Colors.black,
      fontSize: 13.3,
    ),
    headlineSmall: const TextStyle(
      color: Colors.grey,
      fontSize: 20.0,
      letterSpacing: 0.5,
    ),
    bodySmall: const TextStyle(
      color: Colors.black,
      fontSize: 13.3,
    ),

    displayMedium: const TextStyle(
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
    ),
    titleSmall: const TextStyle(
      color: Colors.black,
      fontSize: 15.0,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.blue),
);
