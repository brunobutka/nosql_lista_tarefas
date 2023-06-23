import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nosql_lista_tarefas/add.dart';
import 'package:nosql_lista_tarefas/list_tarefas.dart';
import 'package:nosql_lista_tarefas/main.dart' as app;
import 'package:nosql_lista_tarefas/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Verifica acesso a segunda tela', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verifica se a tela inicial é exibida
    expect(find.byType(Home), findsOneWidget);

    // Clica no ListTile.
    await tester.tap(find.byType(ListTile));
    await tester.pumpAndSettle();

    // Verifica se a tela ListTarefas é exibida.
    expect(find.byType(ListTarefas), findsOneWidget);
  });

  testWidgets('Verifica acesso a tela de adicionar tarefa', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verifica se a tela inicial é exibida
    expect(find.byType(Home), findsOneWidget);

    // Clica no ListTile.
    await tester.tap(find.byType(ListTile));
    await tester.pumpAndSettle();

    // Verifica se a tela ListTarefas é exibida.
    expect(find.byType(ListTarefas), findsOneWidget);

    await tester.pumpAndSettle();

    // Clica no addButton
    final addButtonFinder = find.byKey(Key('addButton'));
    expect(addButtonFinder, findsOneWidget);
    await tester.tap(addButtonFinder);

    await tester.pumpAndSettle();

    // Verifica se acessou corretamente a tela de adicionar tarefas
    expect(find.byType(AddTarefa), findsOneWidget);
  });


  testWidgets('Fluxo Principal APP', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verifica se a tela inicial é exibida
    expect(find.byType(Home), findsOneWidget);

    // Clica no ListTile.
    await tester.tap(find.byType(ListTile));
    await tester.pumpAndSettle();

    // Verifica se a tela ListTarefas é exibida.
    expect(find.byType(ListTarefas), findsOneWidget);

    await tester.pumpAndSettle();

    // Clica no addButton
    final addButtonFinder = find.byKey(Key('addButton'));
    expect(addButtonFinder, findsOneWidget);
    await tester.tap(addButtonFinder);

    await tester.pumpAndSettle();

    // Preenche os campos de texto
    final textField1Finder = find.byKey(Key('disciplinaField'));
    expect(textField1Finder, findsOneWidget);
    await tester.enterText(textField1Finder, 'Tópicos Especiais: Flutter');

    final textField2Finder = find.byKey(Key('nomeField'));
    expect(textField2Finder, findsOneWidget);
    await tester.enterText(textField2Finder, 'Trabalho G2');

    final textField3Finder = find.byKey(Key('dataField'));
    expect(textField3Finder, findsOneWidget);
    await tester.enterText(textField3Finder, '24/06/2023');

    // Clica no saveButton
    final saveButtonFinder = find.byKey(Key('saveButton'));
    expect(saveButtonFinder, findsOneWidget);
    await tester.tap(saveButtonFinder);

    await tester.pumpAndSettle();

    // Verifica se a tela ListTarefas é exibida.
    expect(find.byType(ListTarefas), findsOneWidget);

    // Checa se as informações foram encontradas corretamente na lista
    expect(find.text('Tópicos Especiais: Flutter'), findsOneWidget);
    expect(find.text('Trabalho G2'), findsOneWidget);
    expect(find.text('24/06/2023'), findsOneWidget);
  });
}
