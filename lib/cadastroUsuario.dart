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
      home: const cadastroUsuario(),
    );
  }
}

class cadastroUsuario extends StatefulWidget {
  const cadastroUsuario({super.key});

  @override
  State<cadastroUsuario> createState() => _HomePageState();
}

class _HomePageState extends State<cadastroUsuario> {
  TextEditingController usuarioController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();
  String _textoInfo = "Informe seus dados";

  void _limpar() {
    usuarioController.text = "";
    senhaController.text = "";
    setState(() {
      _textoInfo = "informe os seus dados";
    });
  }

  void _cadastrar() {
    usuarioController.text = "";
    senhaController.text = "";
    setState(() {
      _textoInfo = "Seus dados foram cadastrados com sucesso!!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Usuario"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade300,
        actions: <Widget>[
          IconButton(onPressed: _limpar, icon: Icon(Icons.refresh))
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
              color: Colors.purple,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Usuário",
                labelStyle: TextStyle(color: Colors.black),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: usuarioController,
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.black),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: senhaController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 25.0),
                        backgroundColor: Colors.purple.shade300),
                    onPressed: _cadastrar,
                    child: const Text("Cadastrar")),
              ),
            ),
            Text(
              _textoInfo,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}