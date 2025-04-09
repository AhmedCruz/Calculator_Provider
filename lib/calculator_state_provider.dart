import 'package:flutter/material.dart';

class CalculatorState with ChangeNotifier {
  String _resultado = "0";
  String _historial = "";
  double _operando1 = 0;
  double _operando2 = 0;
  String _operation = "";
  bool _isOperationPressed = false;

  String get resultado => _resultado;
  String get historial => _historial;

  void buttonPressed(String buttonTexto) {
    if (buttonTexto == "AC") {
      _resultado = "0";
      _historial = "";
      _operando1 = 0;
      _operando2 = 0;
      _operation = "";
      _isOperationPressed = false;
    } else if (buttonTexto == "+/-") {
      _resultado = (double.parse(_resultado) * -1).toString();
      if (_resultado.endsWith(".0")) {
        _resultado = _resultado.substring(0, _resultado.length - 2);
      }
    } else if (buttonTexto == "%") {
      _resultado = (double.parse(_resultado) / 100).toString();
    } else if (buttonTexto == ".") {
      if (!_resultado.contains(".")) {
        _resultado += ".";
      }
    } else if (buttonTexto == "+" || buttonTexto == "-" || buttonTexto == "x" || buttonTexto == "÷") {
      _operando1 = double.parse(_resultado);
      _operation = buttonTexto;
      _historial = "$_operando1 $_operation";
      _isOperationPressed = true;
    } else if (buttonTexto == "=") {
      if (_operation.isNotEmpty) {
        _operando2 = double.parse(_resultado);
        switch (_operation) {
          case '+':
            _resultado = (_operando1 + _operando2).toString();
            break;
          case '-':
            _resultado = (_operando1 - _operando2).toString();
            break;
          case 'x':
            _resultado = (_operando1 * _operando2).toString();
            break;
          case '÷':
            _resultado = (_operando1 / _operando2).toString();
            break;
        }
        _historial = "$_operando1 $_operation $_operando2";
        _operation = "";
        _isOperationPressed = false;
        if (_resultado.endsWith(".0")) {
          _resultado = _resultado.substring(0, _resultado.length - 2);
        }
      }
    } else {
      if (_resultado == "0" || _isOperationPressed) {
        _resultado = buttonTexto;
        _isOperationPressed = false;
      } else {
        _resultado += buttonTexto;
      }
    }
    notifyListeners();
  }
}