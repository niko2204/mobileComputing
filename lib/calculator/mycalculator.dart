import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('사칙연산 계산기'),
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String expression = '';
  String result = '0';

  void _onButtonClick(String value) {
    setState(() {
      if (value == 'C') {
        expression = '';
        result = '0';
      } else if (value == '=') {
        try {
          result = _evaluateExpression(expression).toString();
        } catch (e) {
          result = 'Error';
        }
      } else {
        expression += value;
      }
    });
  }

  double _evaluateExpression(String exp) {
    List<String> tokens = _tokenize(exp);
    return _parseTokens(tokens);
  }

  List<String> _tokenize(String exp) {
    List<String> tokens = [];
    String number = '';
    for (int i = 0; i < exp.length; i++) {
      if (_isDigit(exp[i]) || exp[i] == '.') {
        number += exp[i];
      } else {
        if (number.isNotEmpty) {
          tokens.add(number);
          number = '';
        }
        tokens.add(exp[i]);
      }
    }
    if (number.isNotEmpty) {
      tokens.add(number);
    }
    return tokens;
  }

  bool _isDigit(String ch) {
    return '0123456789'.contains(ch);
  }

  double _parseTokens(List<String> tokens) {
    List<double> values = [];
    List<String> ops = [];

    for (String token in tokens) {
      if (_isDigit(token) || token.contains('.')) {
        values.add(double.parse(token));
      } else {
        while (ops.isNotEmpty && _precedence(ops.last) >= _precedence(token)) {
          double b = values.removeLast();
          double a = values.removeLast();
          String op = ops.removeLast();
          values.add(_applyOp(a, b, op));
        }
        ops.add(token);
      }
    }

    while (ops.isNotEmpty) {
      double b = values.removeLast();
      double a = values.removeLast();
      String op = ops.removeLast();
      values.add(_applyOp(a, b, op));
    }

    return values.last;
  }

  int _precedence(String op) {
    if (op == '+' || op == '-') return 1;
    if (op == '*' || op == '/') return 2;
    return 0;
  }

  double _applyOp(double a, double b, String op) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        return a / b;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(
            expression,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(
            result,
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 2,
            ),
            itemCount: buttons.length,
            itemBuilder: (context, index) {
              return _buildButton(buttons[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: value.isEmpty ? null : () => _onButtonClick(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

const List<String> buttons = [
  '7', '8', '9', '/',
  '4', '5', '6', '*',
  '1', '2', '3', '-',
  '.', '0', 'C', '+',
  '', '', '', '='
];
