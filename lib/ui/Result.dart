// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  String _img;
  String _texto;
  Color _color;

  Result(this._img, this._texto, this._color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
        backgroundColor: _color,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              _img,
              fit: BoxFit.cover,
              height: 300,
            ),
            Center(
              child: Text(_texto),
            )
          ]),
    );
  }
}
