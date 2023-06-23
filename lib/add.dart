import 'package:flutter/material.dart';
import 'package:nosql_lista_tarefas/nosql/tarefa.dart';

class AddTarefa extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _disciplinaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Tarefa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Disciplina",
                    labelText: "Disciplina"
                ),
                controller: _disciplinaController,
<<<<<<< HEAD
=======
                key: Key("disciplinaField"),
>>>>>>> IntegrationTest2
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira a disciplina';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nomeController,
<<<<<<< HEAD
=======
                key: Key("nomeField"),
>>>>>>> IntegrationTest2
                decoration: const InputDecoration(
                    hintText: "Nome da Tarefa",
                    labelText: "Nome da Tarefa"
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira o nome da tarefa';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dataController,
<<<<<<< HEAD
=======
                key: Key("dataField"),
>>>>>>> IntegrationTest2
                decoration: const InputDecoration(
                    hintText: "Data de Entrega",
                    labelText: "Data de Entrega",
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira a data de entrega';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
<<<<<<< HEAD
=======
                  key: Key("saveButton"),
>>>>>>> IntegrationTest2
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Tarefa tarefa = Tarefa(
                          nome: _nomeController.text,
                          disciplina: _disciplinaController.text,
                          data: _dataController.text
                      );
                      Navigator.pop(context, tarefa);
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}