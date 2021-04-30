import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alcool  ou Gasolina",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.local_gas_station,
                size: 160.0,
                color: Colors.lightBlue[900],
              ),
              TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 26),
                decoration: InputDecoration(
                  labelText: "Valor da gasolina",
                  labelStyle: TextStyle(
                    color: Colors.lightBlue[900],
                  ),
                ),
              ),
              TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 26),
                decoration: InputDecoration(
                  labelText: "Valor da alcool",
                  labelStyle: TextStyle(
                    color: Colors.lightBlue[900],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Verificar"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue[900],
                      onPrimary: Colors.white,
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
