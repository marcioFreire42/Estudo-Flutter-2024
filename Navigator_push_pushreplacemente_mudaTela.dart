import 'package:flutter/material.dart';
import 'package:novo_teste_scaffold/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      appbar: AppBar(
        title: Text('Teste de mudar tela'),
      )
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
    return Scaffold(body: TesteDoTextField());
  }
}

class TesteDoTextField extends StatelessWidget {
  TesteDoTextField({super.key});

  TextEditingController controlerTexto2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          SizedBox(),
          ElevatedButton(
              onPressed: () {
                // Navigatopr usando apenas o Push, 
                // Na AppBar da nova tela haverá a tela de voltar.
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TelaDeLogin()),
                );
              },
              child: Text('Avançar com volta!')),
          ElevatedButton(
              onPressed: () {
                // Navigator com PushReplacement
                // Na nova janela não haverá como retornar, pois será sobreescrita;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TelaDeLogin()),
                );
              },
              child: Text('Avançar SEM volta!'))
        ],
      ),
    );
  }
}
