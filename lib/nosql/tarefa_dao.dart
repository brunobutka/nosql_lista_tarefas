import 'package:floor/floor.dart';
import 'package:nosql_lista_tarefas/nosql/tarefa.dart';

@dao
abstract class TarefaDao {
  @Query('SELECT * FROM Tarefa')
  Future<List<Tarefa>> findAllTarefa();

  @Query('SELECT * FROM Tarefa WHERE id = :id')
  Stream<Tarefa?> findTarefaById(int id);

  @insert
  Future<void> insertTarefa(Tarefa tarefa);

  @delete
  Future<void> deleteTarefa(Tarefa tarefa);
}