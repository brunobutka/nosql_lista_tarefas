import 'package:flutter_test/flutter_test.dart';
import 'package:nosql_lista_tarefas/nosql/tarefa.dart';

// A classe que vamos testar
class Calculator {
  int add(int a, int b) {
    return a + b;
  }
}

void main() {
  group('Calculator', () {
    // Teste para a função add()
    test('add() deve retornar a soma dos dois números', () {
      // Arrange
      final calculator = Calculator();
      final a = 5;
      final b = 10;
      
      // Act
      final result = calculator.add(a, b);
      
      // Assert
      expect(result, equals(15)); // Verifica se o resultado é igual a 15
    });
  });

  final tarefa = Tarefa(disciplina: "IA", nome: "Prova G2", data: "26/06/2023");

  test("Data da tarefa deve vir como 26/06/2023", () {
    expect(tarefa.data, "26/06/2023");
  });
}