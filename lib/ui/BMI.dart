import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BMIState();
  }
}

class BMIState extends State<BMI> {
  final TextEditingController _ageControler = new TextEditingController();
  final TextEditingController _weightControler = new TextEditingController();
  final TextEditingController _heightControler = new TextEditingController();

  double inches = 0.0;
  double result = 0.0;

  String _resultReading = "";

  void calculateBMI() {
    setState(() {
      int age = int.parse(_ageControler.text);
      double height = double.parse(_heightControler.text);
      double weight = double.parse(_weightControler.text);
      inches = height * 12;

      if ((_ageControler.text.isNotEmpty || age > 0) &&
          (_heightControler.text.isNotEmpty || inches > 0) &&
          (_weightControler.text.isNotEmpty || weight > 0)) {
        result = weight / (inches * inches) * 703;

        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Under Weight";
        } else if ((double.parse(result.toStringAsFixed(1)) >= 18.5) &&
            result < 25) {
          _resultReading = "Great Shap ( Normal)";
        } else if ((double.parse(result.toStringAsFixed(1)) > 25) &&
            result < 30) {
          _resultReading = "Over Weight ";
        } else if (double.parse(result.toStringAsFixed(1)) > 30) {
          _resultReading = "Obese";
        } else {}
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Body Mass Index Calculator",
          style: new TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: new Container(
        child: new ListView(
          padding: new EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              width: 90.0,
              height: 90.0,
            ),
            new Container(
              margin: const EdgeInsets.all(2.0),
              height: 260.0,
              color: Colors.grey.shade400,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageControler,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: " e.g  : 43",
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 3.0)),
                  new TextField(
                    controller: _heightControler,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height in Feet",
                        hintText: " e.g  6.5",
                        icon: new Icon(Icons.insert_chart)),
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 3.0)),
                  new TextField(
                    controller: _weightControler,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight in Lbs",
                        hintText: " e.g  180",
                        icon: new Icon(Icons.line_weight)),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: calculateBMI,
                      color: Colors.pink,
                      child: new Text(
                        "Calculate",
                        style: new TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 6.0)),
                new Text(
                  "Your BMI is : ${result.toStringAsFixed(1)}",
                  style: new TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 6.0)),
                new Text(
                  "$_resultReading",
                  style: new TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
