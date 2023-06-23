import 'package:floor/floor.dart';

@entity
class Tarefa {

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String disciplina;
  final String nome;
  final String data;

  Tarefa({this.id, required this.disciplina, required this.nome, required this.data});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'disciplina': disciplina,
      'nome': nome,
      'data': data,
    };
  }

}