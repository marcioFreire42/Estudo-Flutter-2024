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
  // criamos outro objeto da mesma classe que será instanciado pelo construtor;
  late String textoDigitado;

  TextEditingController controlerTexto2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment(0.8, 0.8),
            children: [
              Positioned(
                left: -250,
                top: 50,
                child: CircleAvatar(
                  radius: 160,
                  backgroundColor: Colors.amber,
                ),
              ),
              CircleAvatar(
                radius: 120,
                backgroundColor: Colors.amberAccent,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text('Meu Avatar!'),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
