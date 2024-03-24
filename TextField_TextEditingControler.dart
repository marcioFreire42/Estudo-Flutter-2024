import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Teste do TextField!'),
        ),
        body: TesteDoTextField());
  }
}

class TesteDoTextField extends StatelessWidget {
  TesteDoTextField({super.key});

  // Objeto p/ receber texto de Campo 1 pelo onChanged
  late String textoDigitado;

  // Objeto para receber o texto do campo 2;
  TextEditingController controlerTexto2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),

            // Esse TextField vai transferir o conteúdo para uma String sem controler,
            // através do método onChanged;
            child: TextField(
              onChanged: (text) {
                // Vinculação feita;
                textoDigitado = text;
              },
              decoration: const InputDecoration(
                labelText: 'Digite o Texto!',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print(textoDigitado);
              },
              child: const Text('Primir Texto')),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              // Nesse caso usamos um TextEditingControler,
              // Mais diíficl de implementar, mas temos mais controle e mais opções.
              controller: controlerTexto2,
              decoration: InputDecoration(
                  labelText: 'Digite o texto 2!', border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print('${controlerTexto2.text}');
              },
              child: Text('confirma!'))
        ],
      ),
    );
  }
}
