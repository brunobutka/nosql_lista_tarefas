import 'package:flutter/material.dart';
import 'package:nosql_lista_tarefas/add.dart';
import 'package:nosql_lista_tarefas/nosql/app_database.dart';
import 'package:nosql_lista_tarefas/nosql/tarefa.dart';
import 'package:nosql_lista_tarefas/nosql/tarefa_dao.dart';

class ListTarefas extends StatefulWidget {
  const ListTarefas({super.key});

  @override
  _ListTarefasState createState() => _ListTarefasState();

}

class _ListTarefasState extends State<ListTarefas> {

  AppDatabase? database;
  TarefaDao? tarefaDao;
  List<Tarefa> tarefas = [];

  @override
  void initState() {
    super.initState();
    getDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
        actions: <Widget>[
          if (database != null)
            IconButton(
            icon: const Icon(Icons.add),
            key: Key("addButton"),
            onPressed: (){
              Future<dynamic> future = Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTarefa(),
                  ));
              future.then((tarefa) {
                insertTarefa(tarefa);
              });
            },
          )
        ],
      ),
      body: ListView.separated(
        itemCount: tarefas.length,
        itemBuilder: (context, index) => buildListItem(index),
        separatorBuilder: (context, index) => const Divider(
          height: 1,
        ),
      ),
    );
  }

  Widget buildListItem(int index){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          leading: Text("${tarefas[index].id}"),
          title: Text(tarefas[index].disciplina),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tarefas[index].nome),
              Text(tarefas[index].data),
            ],
          ),
          onLongPress: (){
            deleteTarefa(index);
          },
        ),
      ),
    );
  }

  getDatabase() async {
    database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    setState(() {});

    tarefaDao = database!.tarefaDao;
    readAll();
  }

  readAll() {
    tarefaDao!.findAllTarefa().then((value) {
      setState(() {
        tarefas = value;
      });
    });
  }

  insertTarefa(Tarefa tarefa) async {
    tarefaDao!.insertTarefa(tarefa).then((value) {
      readAll();
    });
  }

  deleteTarefa(int index) async {
    tarefaDao!.deleteTarefa(tarefas[index]).then((value) {
      readAll();
    });
  }
}