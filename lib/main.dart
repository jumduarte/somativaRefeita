import 'package:flutter/material.dart';
import 'imc.dart';
import 'cadastroUsuario.dart';
import 'cadastroprodutos.dart';
import 'Home.dart';
import 'contador.dart';

void main (){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        initialRoute: '/',
        routes: { '/': (context) => Home(),
          '/segunda': (context) => imc(),
          '/terceira': (context) => Contador(),
          '/quarta': (context) => cadastroUsuario(),
          '/quinta': (context) => Cadastroprodutos(),
        }
    );
  }
}