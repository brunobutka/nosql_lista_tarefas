import 'dart:async';
import 'package:floor/floor.dart';
import 'package:nosql_lista_tarefas/nosql/tarefa.dart';
import 'package:nosql_lista_tarefas/nosql/tarefa_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Tarefa])
abstract class AppDatabase extends FloorDatabase {
  TarefaDao get tarefaDao;
}