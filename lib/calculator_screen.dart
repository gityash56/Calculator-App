// import 'dart:ui';

import 'package:calculator_app/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String userInput = "";
  String answer = "0";

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '/',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              userInput,
              style: const TextStyle(fontSize: 23),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            alignment: Alignment.centerRight,
            child: Text(
              answer,
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return CalculatorButton(
                      buttonTapped: () {
                        setState(() {
                          userInput = "";
                          answer = "0";
                        });
                      },
                      buttonText: buttons[index],
                      backgroundColor: Colors.orange,
                      color: Colors.white,
                    );
                  }
                  if (index == 1) {
                    return CalculatorButton(
                      buttonText: buttons[index],
                      backgroundColor: Colors.blue,
                      color: Colors.white,
                    );
                  }
                  if (index == 2) {
                    return CalculatorButton(
                      buttonTapped: () {
                        setState(() {
                          userInput = userInput + buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      backgroundColor: Colors.blue,
                      color: Colors.white,
                    );
                  }
                  if (index == 3) {
                    return CalculatorButton(
                      buttonTapped: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      backgroundColor: Colors.blue,
                      color: Colors.white,
                    );
                  }
                  if (index == 18) {
                    return CalculatorButton(
                      buttonTapped: onEqualToPressed,
                      buttonText: buttons[index],
                      backgroundColor: Colors.purple,
                      color: Colors.white,
                    );
                  }

                  return CalculatorButton(
                    buttonTapped: () {
                      setState(() {
                        userInput += buttons[index];
                        // userInput = userInput + buttons[index],
                      });
                    },
                    buttonText: buttons[index],
                    backgroundColor:
                        isOperator(buttons[index]) ? Colors.red : Colors.grey,
                    color: isOperator(buttons[index])
                        ? Colors.white
                        : Colors.black,
                  );
                }),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    return x == 'x' || x == '/' || x == '-' || x == '+';
  }

  void onEqualToPressed() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
    setState(() {});
  }
}
