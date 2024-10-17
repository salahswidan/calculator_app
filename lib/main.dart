import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '0';
  String finalResult = '0';
  double num1 = 0;
  double num2 = 0;
  String opr = '';

  buttonPressed(String btnVal) {
    if (btnVal == 'AC') {
      finalResult = '0';
      num1 = 0;
      num2 = 0;
      opr = '';
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      num1 = double.parse(result);
      opr = btnVal;
      finalResult = '0';
      result = result + btnVal;
    } else if (btnVal == '.') {
      // make tast the num have dot or not because the shouldn't have more than one dot
      if (finalResult.contains('.')) {
        // don't added agin
      } else {
        finalResult = finalResult + btnVal; // btnval = dot
      }
    } else if (btnVal == '+/-') {  
      if (result.toString().contains('-')) {
        result
            .toString()
            .substring(1); // mean delete the first cha in this case '-'
        finalResult = result;
      } else {
        result = '-' + result;
        finalResult = result;
      }
    } else if (btnVal == '%') {
      num2 = double.parse(result);
      finalResult = (num2 / 100).toString();
    } else if (btnVal == '=') {
      num2 = double.parse(result);
      if (opr == '+') {
        finalResult = (num1 + num2).toString();
      }
      if (opr == '-') {
        finalResult = (num1 - num2).toString();
      }
      if (opr == 'x') {
        finalResult = (num1 * num2).toString();
      }
      if (opr == '/') {
        finalResult = (num1 / num2).toString();
      }
    } else {
      finalResult = finalResult + btnVal;
    }
    setState(() {
      result = double.parse(finalResult).toString();
    });
  }

  Widget bottonForm(
      {required String textButton,
      required Color textColor,
      required Color bgcolor}) {
    if (textButton != '0') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {
            buttonPressed(textButton);
          },
          shape: CircleBorder(),
          fillColor: bgcolor,
          padding: EdgeInsets.all(15),
          child: Text(
            textButton,
            style: TextStyle(fontSize: 35, color: textColor),
          ),
        ),
      );
    } else {
      return Container(
        child: RawMaterialButton(
          onPressed: () {
            buttonPressed(textButton);
          },
          shape: StadiumBorder(),
          fillColor: bgcolor,
          padding: EdgeInsets.fromLTRB(28, 15, 128, 15),
          child: Text(
            textButton,
            style: TextStyle(fontSize: 35, color: textColor),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$finalResult',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                bottonForm(
                    textButton: 'AC',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '+/-',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '%',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '/',
                    bgcolor: Colors.white,
                    textColor: Colors.blue),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                bottonForm(
                    textButton: '7',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '8',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '9',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: 'x',
                    bgcolor: Colors.white,
                    textColor: Colors.blue),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                bottonForm(
                    textButton: '4',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '5',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '6',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '-',
                    bgcolor: Colors.white,
                    textColor: Colors.blue),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                bottonForm(
                    textButton: '1',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '2',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '3',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '+',
                    bgcolor: Colors.white,
                    textColor: Colors.blue),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                bottonForm(
                    textButton: '0',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '.',
                    bgcolor: Colors.blue,
                    textColor: Colors.white),
                bottonForm(
                    textButton: '=',
                    bgcolor: Colors.white,
                    textColor: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
