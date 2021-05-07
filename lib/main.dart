import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();

  String _resultado = "Informe os valores";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _calcularCombustivelIdeal() {
    setState(() {
      double vAlcool = double.parse(alcoolController.text.replaceAll(",", "."));
      double vGasolina =
          double.parse(gasolinaController.text.replaceAll(",", "."));

      double proporcao = vAlcool / vGasolina;

      _resultado =
          (proporcao < 0.7) ? "Abasteça com alcool" : "Abasteça com gasolina";
    });
  }

  void _reset() {
    alcoolController.text = "";
    gasolinaController.text = "";
    _resultado = "Informe os valores";
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou Gasolina",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _reset,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.local_gas_station,
                size: 160.0,
                color: Colors.lightBlue[900],
              ),
              TextFormField(
                controller: gasolinaController,
                validator: (value) =>
                    value!.isEmpty ? "Informe o valor da gasolina" : null,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
                decoration: InputDecoration(
                    labelText: "Valor da Gasolina",
                    labelStyle: TextStyle(color: Colors.lightBlue[900])),
              ),
              TextFormField(
                controller: alcoolController,
                validator: (value) =>
                    value!.isEmpty ? "Informe o valor do alcool" : null,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
                decoration: InputDecoration(
                    labelText: "Valor da Álcool",
                    labelStyle: TextStyle(color: Colors.lightBlue[900])),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calcularCombustivelIdeal();
                      }
                    },
                    child: Text('Verificar'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue[900],
                        onPrimary: Colors.white,
                        textStyle: TextStyle(fontSize: 25.0)),
                  ),
                ),
              ),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
