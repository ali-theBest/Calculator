import 'package:first/button.dart';
import 'package:flutter/material.dart';

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
                      child: Text(
                        userAsk,
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    //userHint
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 60,
                      color: Colors.blue[100],
                      alignment: Alignment.centerRight,
                      child: Text(
                        userHint,
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    //userAnswer

                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 60,
                      color: Colors.blue[100],
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
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
                  if (myButton[index] == "AC") {
                    return Button(
                      buttonColor: Colors.amber,
                      buttonText: myButton[index],
                      textColor: Colors.black,
                      tapped: () {},
                    );
                  } else if (myButton[index] == "Del") {
                    return Button(
                      buttonColor: Colors.red,
                      buttonText: myButton[index],
                      textColor: Colors.black,
                      tapped: () {},
                    );
                  } else if (myButton[index] == "%" ||
                      myButton[index] == "÷" ||
                      myButton[index] == "×" ||
                      myButton[index] == "-" ||
                      myButton[index] == "+") {
                    return Button(
                      buttonColor: Colors.grey.shade300,
                      buttonText: myButton[index],
                      textColor: Colors.black,
                      tapped: () {},
                    );
                  }else if(myButton[index]=="="){
                    return Button(
                      buttonColor: Colors.blue,
                      buttonText: myButton[index],
                      textColor: Colors.white,
                      tapped: () {},
                    );
                  }else{
                    return Button(
                      buttonColor: Colors.grey.shade300,
                      buttonText: myButton[index],
                      textColor: Colors.black,
                      tapped: () {},
                    );
                  }
                },),
            ),
          ],
        ),
      ),
    );
  }
}
