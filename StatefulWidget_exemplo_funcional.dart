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

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
            // ignore: prefer_interpolation_to_compose_strings
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
