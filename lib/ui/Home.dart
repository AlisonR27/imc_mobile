// ignore_for_file: library_private_types_in_public_api, curly_braces_in_flow_control_structures, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'Result.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightCtr = TextEditingController();
  TextEditingController heightCtr = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _textInfo = "";
  void _resetFields() {
    _formKey.currentState!.reset();
    weightCtr.clear();
    heightCtr.clear();
    setState(() {
      _textInfo = "";
    });
  }

  void _fetchBMInfo(double bmi) {
    String _img = "";
    Color _color = Colors.white;
    setState(() {
      if (bmi < 18.6) {
        _textInfo = "Abaixo do peso (${bmi.toStringAsPrecision(4)})";
        _img = "images/thin.png";
        _color = Colors.redAccent.shade200;
      } else if (bmi >= 18.6 && bmi < 24.9) {
        _textInfo = "Peso ideal (${bmi.toStringAsPrecision(4)})";
        _img = "images/normal.png";
        _color = Colors.blueAccent;
      } else if (bmi >= 24.9 && bmi < 29.9) {
        _textInfo = "Levemente acima do peso (${bmi.toStringAsPrecision(4)})";
        _img = "images/fat1.png";
        _color = Colors.orange;
      } else if (bmi >= 29.9 && bmi < 34.9) {
        _textInfo = "Obesidade Grau I (${bmi.toStringAsPrecision(4)})";
        _img = "images/fat2.png";
        _color = Colors.red.shade400;
      } else if (bmi >= 34.9 && bmi < 39.9) {
        _textInfo = "Obesidade Grau II (${bmi.toStringAsPrecision(4)})";
        _img = "images/fat3.png";
        _color = Colors.red.shade600;
      } else if (bmi >= 40) {
        _textInfo = "Obesidade Grau III (${bmi.toStringAsPrecision(4)})";
        _img = "images/thais_carla.jpeg";
        _color = Colors.red.shade800;
      }
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Result(_img, _textInfo, _color)));
  }

  void _calcBMI() {
    setState(() {
      double weight = double.parse(weightCtr.text);
      double height = double.parse(heightCtr.text) / 100;
      double bmi = weight / (height * height);
      _fetchBMInfo(bmi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.refresh,
                  color: Color.fromARGB(255, 3, 2, 2)),
              onPressed: _resetFields)
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person, size: 120),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Peso (em Kgs)",
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25.0),
                  controller: weightCtr,
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Insira o peso.";
                    else
                      return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Altura (em cm)",
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25.0),
                  controller: heightCtr,
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Insira a altura.";
                    else
                      return null;
                  },
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: ButtonTheme(
                        height: 50.0,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) _calcBMI();
                            },
                            child: const Text(
                              "Calcular",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            )))),
              ],
            )),
      ),
    );
  }
}
