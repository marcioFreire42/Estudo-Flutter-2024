import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          title: Text('Teste do TextField !!!'),
        ),
        body: TesteDoTextField());
  }
}

class TesteDoTextField extends StatefulWidget {
  TesteDoTextField({super.key});

  @override
  State<TesteDoTextField> createState() => _TesteDoTextFieldState();
}

class _TesteDoTextFieldState extends State<TesteDoTextField> {
  // Objeto p/ receber texto de Campo 1 pelo onChanged
  late String textoDigitado;

  // Objeto para receber o texto do campo 2;
  TextEditingController controlerTexto2 = TextEditingController();
  TextEditingController controlerTexto3 = TextEditingController();

  // Vamos usar o initState para adicionar uma alteração a um widget, no caso:
  // vamos controlar para que o campo 3 de TextField Só receba 4 digitos
  @override
  void initState() {
    super.initState(); // Essa linha deve ser chamada em método @override;
    controlerTexto3.addListener(() {
      // Adicionamos um listener para o controler3
      final texto = controlerTexto3.text;
      if (texto.length > 4) {
        controlerTexto3.text = texto.substring(0, 4);
        // Esse IF analisa se o texto do controler é maior do que 4;
        // Se for, o substring vai excluir os digitos excedentes;
      }
    });
  }

  // Usado para evitar vazamento de memória,
  // Esse método libera o controler3 e finaliza o widget corretamente;
  @override
  void dispose() {
    super.dispose();
    controlerTexto3.dispose();
  }

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
              child: Text('confirma!')),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              // Vamos implementar mais opções nesse campo
              // Esse campo só receberá digitos e só 4.
              // O tamanho de 4 digitos foi feito pelo initState.
              controller: controlerTexto3,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                // Aqui filtramos para que somente os digitos de 0 a 9 possam ser digitados;
                // A sugestão era dentro do RegExp usar '[0-9], {0,4}', mas do jeito que está deu certo.
              ],
              decoration: const InputDecoration(
                  labelText: 'Digite o texto 3!', border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print('${controlerTexto3.text}');
              },
              child: Text('confirma!!!')),
        ],
      ),
    );
  }
}
