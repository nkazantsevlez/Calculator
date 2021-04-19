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

  Widget buildButton( String buttonNumber){
    return Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonNumber),
        onPressed: ()=>{},
        color: Colors.cyan,
        textColor: Colors.white,),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column( children: [
          new Text("0"),

          new Expanded(
            child: new Divider(),

          ),

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
