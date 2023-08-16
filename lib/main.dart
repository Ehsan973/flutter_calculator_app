import 'package:calculator_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  var inputUser = '';
  var result = '';

  void buttonPressed(String text) {
    if (text == 'ac') {
      setState(() {
        inputUser = '';
        result = '';
      });
    } else if (text == 'ce') {
      if (inputUser.length != 0) {
        setState(() {
          inputUser = inputUser.substring(0, inputUser.length - 1);
        });
      }
    } else if (text == '=') {
      Parser parser = Parser();
      Expression expression = parser.parse(inputUser);
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      setState(() {
        result = eval.toString();
      });
    } else {
      setState(() {
        inputUser += text;
      });
    }
  }

  Widget getRow(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            buttonPressed(text1);
          },
          style: TextButton.styleFrom(
            backgroundColor: getBackgroundColor(text1),
            shape: CircleBorder(),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              text1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, color: getTextColor(text1)),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            buttonPressed(text2);
          },
          style: TextButton.styleFrom(
            backgroundColor: getBackgroundColor(text2),
            shape: CircleBorder(),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              text2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, color: getTextColor(text2)),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            buttonPressed(text3);
          },
          style: TextButton.styleFrom(
            backgroundColor: getBackgroundColor(text3),
            shape: CircleBorder(
              side: BorderSide(
                width: 0,
                color: Colors.transparent,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              text3,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, color: getTextColor(text3)),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            buttonPressed(text4);
          },
          style: TextButton.styleFrom(
            backgroundColor: getBackgroundColor(text4),
            shape: CircleBorder(
              // borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 0,
                color: Colors.transparent,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              text4,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, color: getTextColor(text4)),
            ),
          ),
        ),
      ],
    );
  }

  bool isOperator(String text) {
    var operators = ['ac', 'ce', '%', '/', '*', '-', '+', '='];
    for (var operator in operators) {
      if (text == operator) {
        return true;
      }
    }
    return false;
  }

  Color getBackgroundColor(String text) {
    if (isOperator(text)) {
      return backgroundGreyDark;
    } else {
      return backgroundGrey;
    }
  }

  Color getTextColor(String text) {
    if (isOperator(text)) {
      return textGreen;
    } else {
      return textGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundGrey,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: backgroundGreyDark,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          inputUser,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 28,
                              color: textGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        result,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: textGrey,
                          fontSize: 62,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: backgroundGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getRow('ac', 'ce', '%', '/'),
                      getRow('1', '2', '3', '*'),
                      getRow('4', '5', '6', '-'),
                      getRow('7', '8', '9', '+'),
                      getRow('00', '0', '.', '='),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
