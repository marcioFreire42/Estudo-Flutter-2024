import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  // Criamos o objeto que vai receber o json puxado pela API;
  // Perceba que o objeto é do tipo Map<String, dynamic>
  late Map<String, dynamic> jsonData;
  String textoDoJson = 'nada';

  // O método que vai puxar o json, é um Future, usando async e await;
  Future<void> getData() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    // Normalmente a url pura não passa no http.get, por isso usamos o Uri.parse,
    // Isso converte o texto para uma Uri que o Http.get entende;
    if (response.statusCode == 200) {
      jsonData =
          jsonDecode(response.body); // Convertendo o puxado para o objeto;
      print(jsonData);
    } else {
      throw Exception('Erro no Json!');
    }

    textoDoJson = jsonData['title'];
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
            Text(
              textoDoJson,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    getData();
                  });
                },
                child: Text('Carregar Jason'))
          ],
        ),
      ),
    );
  }
}
