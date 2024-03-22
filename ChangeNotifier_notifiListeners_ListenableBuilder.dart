import 'package:flutter/material.dart';
//import 'package:novo_teste_scaffold/contador.dart';

class Contador extends ChangeNotifier {
  // A classe ChangeNotifier serve para avisar Á vários widgets mudanças em um objeto;
  // Uma classe que extende ela pode atualizar componentes de um widget sem usar o setStage;

  int count = 0;

  Contador();

  void incrementaCount() {
    count++;
    notifyListeners();
    // Serve para avisar a todos os ouvintes que houve mudança que deve ser alterada;
  }
}

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
  final Contador contador = Contador();
  // Cria a instancia do contador;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Teste do ChangeNotifier!'),
        ),
        body: CorpoContador(
          // Criamos nosso widget e atribuimos para ele o atributo counterNotifier,
          // Passamos também como parâmetro o objeto com o notifiListeners();
          counterNotifier: contador,
        ));
  }
}

class CorpoContador extends StatelessWidget {
  const CorpoContador({super.key, required this.counterNotifier});
  // criamos outro objeto da mesma classe que será instanciado pelo construtor;
  final Contador counterNotifier;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          // O Widget que sofrerá a mudança sera wrapped por um ListenableBuilder;
          ListenableBuilder(
            listenable: counterNotifier,
            builder: (BuildContext context, Widget? child) {
              return Text(
                ' O valor é de: ${counterNotifier.count}',
                style: const TextStyle(fontSize: 50),
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                counterNotifier.incrementaCount();
              },
              child: Text('++'))
        ],
      ),
    );
  }
}
