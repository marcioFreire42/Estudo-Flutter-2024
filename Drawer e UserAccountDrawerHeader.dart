import 'package:flutter/material.dart';

class TelaDeLogin extends StatefulWidget {
  const TelaDeLogin({super.key});

  @override
  State<TelaDeLogin> createState() => _TelaDeLoginState();
}

class _TelaDeLoginState extends State<TelaDeLogin> {
  TextEditingController controladorLogin = TextEditingController();
  TextEditingController controladorSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset('asset/imagens/nebula.jpg')),
                  accountName: Text('Márcio Freire'),
                  accountEmail: Text('c135532@gmail')),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                subtitle: Text('Pág 1!'),
                onTap: () {
                  print('OPção 1');
                },
              ),
              Divider(),
              const ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('Ações'),
                subtitle: Text('Pág 1!'),
              ),
              Divider(),
              const ListTile(
                leading: Icon(Icons.money_sharp),
                title: Text('ETFs'),
                subtitle: Text('Pág 1!'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.attach_money_outlined),
                title: Text('Stocks'),
                subtitle: Text('Pág 1!'),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Tela de Login'),
          backgroundColor: Colors.amberAccent,
        ),
        body: Column(
          children: [
            // Restante do texto do body;
          ],
        ),
      ),
    );
  }
}
