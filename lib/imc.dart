import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const imc(),
    );
  }
}

class imc extends StatefulWidget {
  const imc({super.key});

  @override
  State<imc> createState() => _HomePageState();
}

class _HomePageState extends State<imc> {
  TextEditingController pesoController =  TextEditingController();
  TextEditingController alturaController =  TextEditingController();
  String _textoInfo = "Informe seus dados";

  void _limpar_Tela(){
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _textoInfo = "Informe seus dados";
    });
  }

  void _calcular_Imc(){
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double imc = peso / pow((altura/100), 2);

      if(imc < 16.5){
        _textoInfo = "Desnutrido (${imc})";
      }
      else if(imc<=18.5){
        _textoInfo = "Abaixo do peso(${imc})";
      }
      else if(imc<=24.9){
        _textoInfo = "Peso ideal(${imc})";
      }
      else if(imc<=29.9) {
        _textoInfo = "Sobre peso(${imc})";
      }
      else if(imc<=34.9) {
        _textoInfo = "Obesidade grau I(${imc})";
      }
      else if(imc<=39.9){
        _textoInfo = "Obesidade grau II(${imc})";
      }
      else{
        _textoInfo = "Obesdade grau III(${imc})";
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen.shade300,
        actions: <Widget>[
          IconButton(
              onPressed: _limpar_Tela,
              icon: Icon(Icons.refresh)
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.person_outline,
              size: 120.0,
              color: Colors.black,
            ) ,
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "PESO (KG)",
                  labelStyle: TextStyle(color: Colors.lightGreen.shade300)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: pesoController,
            ),
            // Segundo Imput para a altura
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "ALTURA (CM)",
                  labelStyle: TextStyle(color: Colors.lightGreen.shade300)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: alturaController,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height:50.0,
                child: ElevatedButton(
                    onPressed: _calcular_Imc,
                    child: const Text("Calcular")
                ),
              ),
            ),
            // botão para executar o calculo imc
            Text(
              _textoInfo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightGreen.shade300,
                  fontSize: 25.0
              ),
            )
          ],
        ),
      ),
    );
  }
}