import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:myproject/meuObjeto.dart';
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
  // Cria uma lista de Objetos;
  // 20 é a quantidade que será criada
  final List<MeuObjeto> listaDeTodos = List.generate(
      20, (index) => MeuObjeto('Objeto $index', index + 3, index * 1.2));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Aqui uma ListView é criada coma  lista que possuiamos
              ListView.builder(
                  shrinkWrap: true, // Evita erros de espaço!!
                  itemCount: listaDeTodos.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: ListTile(
                          onTap: () {
                            // No ontap, acessaremos a tela doisx, passando o objeto como parâmetro.
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Pag2(object: listaDeTodos[index])));
                          },
                          title: Text(listaDeTodos[index].nome),
                          subtitle: Text(
                              'O valor é de ${listaDeTodos[index].valor.toString()}'),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

//_________________________________________________________
// Código da página dois;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:myproject/meuObjeto.dart';

class Pag2 extends StatefulWidget {
  const Pag2({super.key, required MeuObjeto this.object});
  // Veja que o objeto foi recebido como uma parametro required;
  final MeuObjeto object;

  @override
  State<Pag2> createState() => _Pag2State();
}

class _Pag2State extends State<Pag2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pag2'),
      ),
      body: Center(
          child: Column(
        children: [
          // Para acessar o objeto temos que acessar o widget primeiro.
          Text(widget.object.nome.toString()),
          Text(widget.object.papeis.toString()),
          Gap(15),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Passar valor!!'))
        ],
      )),
    );
  }
}

// Nosso objeto
class MeuObjeto {
  final String nome;
  final int papeis;
  final double valor;

  const MeuObjeto(this.nome, this.papeis, this.valor);
}

