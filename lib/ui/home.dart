import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new HomeState();
    }
}

class HomeState extends State<Home>{
  final TextEditingController _agecontroller=new TextEditingController();
  final TextEditingController _heightcontroller=new TextEditingController();
  final TextEditingController _weightcontroller=new TextEditingController();
  double _bmi=0.0;
  void _calculate(){
    setState(() {
         if((int.parse(_weightcontroller.text).toString().isNotEmpty&&int.parse(_weightcontroller.text)>0)
          &&int.parse(_heightcontroller.text).toString().isNotEmpty&&int.parse(_heightcontroller.text)>0){
            _bmi=(int.parse(_weightcontroller.text)/(int.parse(_heightcontroller.text)*int.parse(_heightcontroller.text)));
          }else{
            _bmi=0.0;
          } 
        });
    
  }
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("BMI"),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body: new Container(
          alignment: Alignment.topCenter,
          child: new ListView(
            children: <Widget>[
              new Image.asset(
                'images/bmilogo.png',
                width: 90.0,
                height: 90.0,
              ),
              new Container(
                height: 400.0,
                color: Colors.blueGrey[100],
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _agecontroller,
                      decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: "Age",
                        icon: Icon(Icons.person)
                      ),
                    ),
                    new TextField(
                      controller: _heightcontroller,
                      decoration: new InputDecoration(
                        labelText: "Height in metres",
                        hintText: "Height in metres",
                        icon: Icon(Icons.assessment)
                      ),
                    ),
                    new TextField(
                      controller: _weightcontroller,
                      decoration: new InputDecoration(
                        labelText: "Weight in kg",
                        hintText: "Weight in kg",
                        icon: Icon(Icons.format_align_justify)
                      ),
                    ),
                    new Padding(padding: new EdgeInsets.all(10.5),),
                    new Center(
                      child: new Row(
                        children: <Widget>[
                          new Padding(padding: new EdgeInsets.only(left:90.9),),
                          new Container(
                            margin: const EdgeInsets.only(left: 38.0),
                            child: new RaisedButton(
                              onPressed: _calculate,
                              color: Colors.pinkAccent,
                              child: new Text("Calculate",
                              style: new TextStyle(color: Colors.white,
                              fontSize: 16.9),),
                            ),
                          )
                        ],
                      ),
                    ),
                    new Padding(padding: new EdgeInsets.only(top: 17.9),),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _agecontroller.text.isNotEmpty&&
                        _heightcontroller.text.isNotEmpty&&
                        _weightcontroller.text.isNotEmpty?
                        new Text('BMI is $_bmi',
                        style: new TextStyle(color: Colors.red,
                        fontSize: 17.5),):
                        new Text('Please enter all fields',
                        style:new TextStyle(color: Colors.red,),)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
}