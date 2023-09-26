import 'package:flutter/material.dart';
import 'package:a8/ui/Home.dart';

void main() {
  runApp(MaterialApp(
      title: "Calculadora IMC - Segunda versão",
      theme: ThemeData(
          primarySwatch: Colors.red,
          colorScheme: ColorScheme(
              background: Colors.grey.shade800,
              brightness: Brightness.dark,
              primary: Colors.pinkAccent.shade400,
              onPrimary: Colors.red,
              secondary: Colors.red,
              onSecondary: Colors.orange,
              error: Colors.black,
              onError: Colors.red.shade900,
              onBackground: Colors.grey.shade600,
              surface: Colors.grey.shade800,
              onSurface: Colors.white)),
      home: const Home()));
}
