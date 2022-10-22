import 'package:auto_size_text/auto_size_text.dart';
import 'package:first/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userAsk = "";
  String userHint = "";
  String userAnswer = "";

  List<String> myButton = [
    "AC",
    "Del",
    "%",
    "÷",
    "7",
    "8",
    "9",
    "×",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "Ans",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //userAsk
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 60,
                  color: Colors.blue[100],
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    userAsk,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
                //userHint
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 60,
                  color: Colors.blue[100],
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    userHint,
                    maxLines: 1,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                //userAnswer

                Container(
                  margin: const EdgeInsets.all(10),
                  height: 60,
                  color: Colors.blue[100],
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    userAnswer,
                    maxLines: 1,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            )),
            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: myButton.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  //ac button
                  if (myButton[index] == "AC") {
                    return Button(
                      buttonColor: Colors.amber,
                      buttonText: myButton[index],
                      textColor: Colors.black,
                      tapped: () {
                        setState(() {
                          userAnswer = "";
                          userAsk = "";
                          userHint = "";
                        });
                      },
                    );
                    //del button
                  } else if (myButton[index] == "Del") {
                    return Button(
                      buttonColor: Colors.red,
                      buttonText: myButton[index],
                      textColor: Colors.black,
                      tapped: () {
                        setState(() {
                          if (userAsk.length > 0) {
                            userAsk = userAsk.substring(0, userAsk.length - 1);
                          }
                        });
                      },
                    );
                  } else if (myButton[index] == "%" ||
                      myButton[index] == "÷" ||
                      myButton[index] == "×" ||
                      myButton[index] == "-" ||
                      myButton[index] == "+") {
                    return Button(
                      buttonColor: Colors.blue,
                      buttonText: myButton[index],
                      textColor: Colors.black,
                      tapped: () {
                        setState(() {
                          userAsk += myButton[index];
                        });
                      },
                    );
                  } else if (myButton[index] == "=") {
                    return Button(
                      buttonColor: Colors.blue,
                      buttonText: myButton[index],
                      textColor: Colors.white,
                      tapped: () {
                        setState(() {
                          equal();
                          if(userAnswer.endsWith(".0"))
                          {
                           userAnswer=userAnswer.replaceAll(".0", "");
                          }
                          if(userAnswer.length ==1)
                          {
                            userHint="يعني انت شغلتني علشان دي";
                          }
                          if(userAnswer.length>7)
                          {
                            userHint="🙄انت فاكر انك كده بتعجزني ";
                          }
                          
                        });
                      },
                    );
                  } else {
                    return Button(
                      buttonColor: Colors.grey.shade300,
                      buttonText: myButton[index],
                      textColor: Colors.black,
                      tapped: () {
                        setState(() {
                          userAsk = userAsk + myButton[index];
                        });
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equal() {
    try {
      String finalAsk = userAsk;
      finalAsk = finalAsk.replaceAll("×", "*");
      finalAsk = finalAsk.replaceAll("÷", "/");
      Parser p = Parser();
      Expression exp = p.parse(finalAsk);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      userAnswer = eval.toString();
    } catch (e) {
      if (userAsk.endsWith("÷"))
       {
        userHint = "🙄نسيت هتقسم على إية";
        userAnswer = "";
      } 
      else if (userAsk.endsWith("×")) 
      {
        userHint = " 🙂عندي السكر ياعم هتضرب فى ايه";
        userAnswer = "";
      } 
      else if (userAsk.endsWith("-")) 
      {
        userHint = " نسيت هتطرح إية";
        userAnswer = "";
      } 
      else if (userAsk.endsWith("+"))
       {
        userHint = "🤕جالي الضغط منك هتجمع إية";
        userAnswer = "";
      } 
      else {
        userAnswer = "Error";
      }
    }
  }
}
