import 'package:flutter/material.dart';

main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

// Aqui a classe que cuida do gerenciamento do Status
// O código principal não fica aqui, mas esse bloco deve ser criado.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyappState(contador: 0);
  }
}

class MyappState extends State<StatefulWidget> {
  int contador;

  MyappState({required this.contador});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Column(
        children: [
          Center(
              child: Text(
            'Flutter! contador = $contador',
          )),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  contador++;
                });
              },
              child: Text('Clique aqui'))
        ],
      ),
    );
  }
}
