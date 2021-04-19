import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Калькулятор'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //variables for calculations
  String output="0";
  String _output="0";
  double number1=0.0;
  double number2=0.0;
  String operand="";

  //creating a button
  Widget buildButton( String buttonNumber){
    return Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonNumber),
        onPressed: ()=>
          buttonPressed(buttonNumber),

        color: Colors.cyan,
        textColor: Colors.white,),
    );
  }
  //description of the event when the buttons are pressed
  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      number1 = 0.0;
      number2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" ||
        buttonText == "*") {
      number1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("поставлена точка");
        return;
      } else
        {
          _output += buttonText;
        }
    }else if(buttonText=="=")
              {
              number2=double.parse(output);
              switch(operand)
              {
              case "+": _output=(number1+number2).toString(); break;
              case "-": _output=(number1-number2).toString(); break;
              case "*": _output=(number1*number2).toString(); break;
              case "/": _output=(number1/number2).toString(); break;
              }
              number1=0.0;
              number2=0.0;
              operand="";
              } else
                {
                  _output+=buttonText;
                }

    print(_output);

    setState(() {
      output=double.parse(_output).toString();
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: new Container(

        child: new Column( children: [
          Container(
            alignment: Alignment.centerRight,
            padding: new EdgeInsets.symmetric(
            vertical: 24.0,
              horizontal: 12.0

        ),
          //creating an element for displaying input numbers
              child: new Text(output, style: new TextStyle(
            fontSize: 40.0,
          ),)),

          new Expanded(
            child: new Divider(),

          ),
          //drawing buttons by columns
          Column(
            children: [ Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),]
              ),
              Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("x"),]
              ),
              Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),]
              ),
              Row(
                  children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("+"),]
              ),
              Row(
                  children: [
                    buildButton("C"),
                    buildButton("="),]
              ),
            ],
          )
        ],)


      )
    );
  }
}
