import 'package:calculator_app/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  Widget getRow(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
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
          onPressed: () {},
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
          onPressed: () {},
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
          onPressed: () {},
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
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: backgroundGreyDark,
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
    );
  }
}
