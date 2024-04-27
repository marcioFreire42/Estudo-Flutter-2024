import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:myproject/pag2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _meuTexto = 'Aguardando seu texto!! ';

  //Future que recebe um String da tela dois, para atualizar e apresentar na tela 1
  Future<String> _navegarParaPag2() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Pag2()));
    return result ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_meuTexto),
            ElevatedButton(
              // Aqui a mágica acontece
              // O iten digitado na dois e setado e atualizado.
                onPressed: () async {
                  final textoRetornado = await _navegarParaPag2();
                  setState(() {
                    _meuTexto = textoRetornado;
                  });
                },
                child: Text('Avançar Para Tela dois!!'))
          ],
        ),
      ),
    );
  }
}
//____________________________________________
// Código da página dois

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class Pag2 extends StatefulWidget {
  const Pag2({super.key});

  @override
  State<Pag2> createState() => _Pag2State();
}

class _Pag2State extends State<Pag2> {
  TextEditingController controler = TextEditingController();

  // Esse método limpa o controler, 
  // garante um melhor uso da memória
  @override
  void dispose() {
    controler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pag2'),
      ),
      body: Center(
          child: Column(
        children: [
          Text('Você está na página dois!'),
          Gap(15),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controler,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
              decoration: InputDecoration(
                  labelText: 'Digite o novo Texto!',
                  border: OutlineInputBorder()),
            ),
          ),
          Gap(15),
          ElevatedButton(
              onPressed: () {
                // O detalhe aqui é só que o pop envia o text do controler
                Navigator.pop(context, controler.text);
              },
              child: Text('Passar valor!!'))
        ],
      )),
    );
  }
}
