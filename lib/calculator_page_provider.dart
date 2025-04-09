import 'package:calculadora/widgets/button_calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_state_provider.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  void _buttonPressed(BuildContext context, String buttonTexto) {
    Provider.of<CalculatorState>(context, listen: false).buttonPressed(buttonTexto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Consumer<CalculatorState>(
          builder: (context, calculatorState, child) => Column(
            children: [
              _widgetHistorial(calculatorState.historial),
              _widgetOpActual(calculatorState.resultado),
              Row(
                children: [
                  ButtonCalculator(text: "AC",bgColor: const Color.fromARGB(255, 0, 0, 0),onPressed: () => _buttonPressed(context, "AC"),),
                  ButtonCalculator(text: "+/-",bgColor: const Color.fromARGB(255, 0, 0, 0),onPressed: () => _buttonPressed(context, "+/-"),),
                  ButtonCalculator(text: "%",bgColor: const Color.fromARGB(255, 0, 0, 0),onPressed: () => _buttonPressed(context, "%"),),
                  ButtonCalculator(text: "÷",bgColor: const Color.fromARGB(255, 0, 0, 0),fgColor: Colors.white,onPressed: () => _buttonPressed(context, "÷"),),
                ],
              ),
              Row(
                children: [
                  ButtonCalculator(text: "7", onPressed: () => _buttonPressed(context, "7")),
                  ButtonCalculator(text: "8", onPressed: () => _buttonPressed(context, "8")),
                  ButtonCalculator(text: "9", onPressed: () => _buttonPressed(context, "9")),
                  ButtonCalculator(text: "x",bgColor: const Color.fromARGB(255, 0, 0, 0),fgColor: Colors.white,onPressed: () => _buttonPressed(context, "x"),),
                ],
              ),
              Row(
                children: [
                  ButtonCalculator(text: "4", onPressed: () => _buttonPressed(context, "4")),
                  ButtonCalculator(text: "5", onPressed: () => _buttonPressed(context, "5")),
                  ButtonCalculator(text: "6", onPressed: () => _buttonPressed(context, "6")),
                  ButtonCalculator(text: "-",bgColor: const Color.fromARGB(255, 0, 0, 0),fgColor: Colors.white,onPressed: () => _buttonPressed(context, "-"),),
                ],
              ),
              Row(
                children: [
                  ButtonCalculator(text: "1", onPressed: () => _buttonPressed(context, "1")),
                  ButtonCalculator(text: "2", onPressed: () => _buttonPressed(context, "2")),
                  ButtonCalculator(text: "3", onPressed: () => _buttonPressed(context, "3")),
                  ButtonCalculator(text: "+",bgColor: const Color.fromARGB(255, 0, 0, 0),fgColor: Colors.white,onPressed: () => _buttonPressed(context, "+"),),
                ],
              ),
              Row(
                children: [
                  ButtonCalculator(text: "00", onPressed: () => _buttonPressed(context, "00")),
                  ButtonCalculator(text: "0", onPressed: () => _buttonPressed(context, "0")),
                  ButtonCalculator(text: ".", onPressed: () => _buttonPressed(context, ".")),
                  ButtonCalculator(text: "=",bgColor: Colors.orange,fgColor: Colors.white,onPressed: () => _buttonPressed(context, "="),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widgetOpActual(String resultado) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,
        child: Text(
          resultado,
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _widgetHistorial(String historial) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,
        child: Text(
          historial,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
}
