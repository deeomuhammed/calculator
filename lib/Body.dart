import 'package:calculator/fixed.dart';

import 'package:calculator/switchModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_expressions/math_expressions.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var userInput = '';
  var answer = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor.withOpacity(.4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(21),
                          child: Text(
                            userInput,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(21),
                          child: Text(
                            answer.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                ],
              ),
              color: primaryColor,
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    runAlignment: WrapAlignment.center,
                    children: [
                      NumberButton(
                          bodytext: 'AC',
                          color: Colors.red,
                          function: () {
                            setState(() {
                              userInput = '';
                              answer = '0';
                            });
                          }),
                      NumberButton(
                          bodytext: 'C',
                          color: Colors.red,
                          function: () {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          }),
                      NumberButton(
                          bodytext: '%',
                          color: secondaryColor,
                          function: () {
                            setState(() {
                              userInput += '%';
                            });
                          }),
                      NumberButton(
                          bodytext: '/',
                          color: secondaryColor,
                          function: () {
                            setState(() {
                              userInput += '÷';
                            });
                          }),
                      Button(
                          bodytext: '7',
                          function: () {
                            setState(() {
                              userInput = userInput + '7';
                            });
                          }),
                      Button(
                          bodytext: '8',
                          function: () {
                            setState(() {
                              userInput += '8';
                            });
                          }),
                      Button(
                          bodytext: '9',
                          function: () {
                            setState(() {
                              userInput += '9';
                            });
                          }),
                      NumberButton(
                          bodytext: '*',
                          color: secondaryColor,
                          function: () {
                            setState(() {
                              userInput += 'x';
                            });
                          }),
                      Button(
                          bodytext: '4',
                          function: () {
                            setState(() {
                              userInput += '4';
                            });
                          }),
                      Button(
                          bodytext: '5',
                          function: () {
                            setState(() {
                              userInput += '5';
                            });
                          }),
                      Button(
                          bodytext: '6',
                          function: () {
                            setState(() {
                              userInput += '6';
                            });
                          }),
                      NumberButton(
                          bodytext: '-',
                          color: secondaryColor,
                          function: () {
                            setState(() {
                              userInput += '-';
                            });
                          }),
                      Button(
                          bodytext: '1',
                          function: () {
                            setState(() {
                              userInput += '1';
                            });
                          }),
                      Button(
                          bodytext: '2',
                          function: () {
                            setState(() {
                              userInput += '2';
                            });
                          }),
                      Button(
                          bodytext: '3',
                          function: () {
                            setState(() {
                              userInput += '3';
                            });
                          }),
                      NumberButton(
                          bodytext: '+',
                          color: secondaryColor,
                          function: () {
                            setState(() {
                              userInput += '+';
                            });
                          }),
                      Button(
                          bodytext: '0',
                          function: () {
                            setState(() {
                              userInput += 0.toString();
                            });
                          }),
                      Button(
                          bodytext: '00',
                          function: () {
                            setState(() {
                              userInput += '00';
                            });
                          }),
                      Button(
                          bodytext: '.',
                          function: () {
                            setState(() {
                              userInput += '.';
                            });
                          }),
                      NumberButton(
                          bodytext: '=',
                          color: Colors.green,
                          function: () {
                            setState(() {
                              equalPressed();
                            });
                          }),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  equalPressed() {
    String finaluserinput = userInput;
    print(userInput);
    finaluserinput = userInput.replaceAll('x', '*').replaceAll('÷', '/');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
