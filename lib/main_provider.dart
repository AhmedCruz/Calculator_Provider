import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculadora/calculator_page_provider.dart'; 
import 'package:calculadora/calculator_state_provider.dart'; 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CalculatorState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,  
      home: const CalculatorPage(),
    );
  }
}