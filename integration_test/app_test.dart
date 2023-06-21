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
  });
}
