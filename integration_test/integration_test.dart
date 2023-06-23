import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nosql_lista_tarefas/list_tarefas.dart';
import 'package:nosql_lista_tarefas/main.dart' as app;
import 'package:nosql_lista_tarefas/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('MyApp', () {
    testWidgets('Navigate to ListTarefas screen', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify that the Home screen is displayed.
      expect(find.byType(Home), findsOneWidget);

      // Tap on the ListTile.
      await tester.tap(find.byType(ListTile));
      await tester.pumpAndSettle();

      // Verify that the ListTarefas screen is displayed.
      expect(find.byType(ListTarefas), findsOneWidget);
    });

      await tester.pumpAndSettle();

      //Tap on addButton
      final addButtonFinder = find.byKey(Key('addButton'));
      expect(addButtonFinder, findsOneWidget);
      await tester.tap(addButtonFinder);

      await tester.pumpAndSettle();

      //Fill text fields values
      final textField1Finder = find.byKey(Key('disciplinaField'));
      expect(textField1Finder, findsOneWidget);
      await tester.enterText(textField1Finder, 'Tópicos Especiais: Flutter');

      final textField2Finder = find.byKey(Key('nomeField'));
      expect(textField2Finder, findsOneWidget);
      await tester.enterText(textField2Finder, 'Trabalho G2');

      final textField3Finder = find.byKey(Key('dataField'));
      expect(textField3Finder, findsOneWidget);
      await tester.enterText(textField3Finder, '24/06/2023');

      // Tap on saveButton
      final saveButtonFinder = find.byKey(Key('saveButton'));
      expect(saveButtonFinder, findsOneWidget);
      await tester.tap(saveButtonFinder);

      await tester.pumpAndSettle();

      // Verify that the ListTarefas screen is displayed.
      expect(find.byType(ListTarefas), findsOneWidget);

      // Checks that the information was entered correctly in the list
      expect(find.text('Tópicos Especiais: Flutter'), findsOneWidget);
      expect(find.text('Trabalho G2'), findsOneWidget);
      expect(find.text('24/06/2023'), findsOneWidget);
    });
  });
}
