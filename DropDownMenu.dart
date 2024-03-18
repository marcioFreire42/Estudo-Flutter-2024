import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DropdownMenu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter DropdownMenu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Classe investimento;
// O dropDownMenu será criado desse tipo de Objeto;
// Note! importsante ter o método operator  e hashCode
class Investimento {
  String nome;
  int valor;

  Investimento(this.nome, this.valor);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Investimento &&
          runtimeType == other.runtimeType &&
          nome == other.nome &&
          valor == other.valor;

  @override
  int get hashCode => nome.hashCode ^ valor.hashCode;
}

class _MyHomePageState extends State<MyHomePage> {
  // Variável para armazenar o objeto selecionado;
  Investimento meuInvestimentoAtual = Investimento('cdb', 100);

  // Lista de objetos que será passado como opções do DropDownMenu
  List<Investimento> investmentos = [
    Investimento('cdb', 100),
    Investimento('lci', 200),
    Investimento('Acoes', 400),
    Investimento('ETF', 500),
    Investimento('Tesouro', 70),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            DropdownButton<Investimento>(
              // Cria o menu e especifica o tipo que será tratado;
              value: meuInvestimentoAtual,
              // Define o objeto que vai receber o item selecionado
              // A próxima linha define a lista que será usada nos itens do menu;
              items: investmentos
                  .map<DropdownMenuItem<Investimento>>((Investimento e) {
                return DropdownMenuItem<Investimento>(
                  value: e,
                  child: Text(e.nome),
                );
              }).toList(),
              onChanged: (e) {
                setState(() {
                  meuInvestimentoAtual = e!;
                });
              },
            ),
            SizedBox(height: 20),
            Text(meuInvestimentoAtual.nome),
          ],
        ),
      ),
    );
  }
}
