import 'package:flutter/material.dart';
import 'package:nosql_lista_tarefas/list_tarefas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/floor': (context) => const ListTarefas(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Flutter - NOSQL"),
    ),
    body: ListView(
      children: <Widget>[
        ListTile(
          title: const Text("Floor"),
          subtitle: const Text("Lista de Tarefas"),
          trailing: const Icon(Icons.navigate_next),
          onTap: (){
            Navigator.pushNamed(context, "/floor");
          },
        ),
      ],
    ),
  );
}