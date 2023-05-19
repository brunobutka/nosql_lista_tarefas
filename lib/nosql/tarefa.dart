import 'package:floor/floor.dart';

@entity
class Tarefa {

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String disciplina;
  final String nome;

  Tarefa({this.id, required this.disciplina, required this.nome});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'disciplina': disciplina,
      'nome': nome,
    };
  }

}