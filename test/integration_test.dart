// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nosql_lista_tarefas/main.dart';
import 'package:nosql_lista_tarefas/list_tarefas.dart';

void main() {
  testWidgets('Navigate to ListTarefas screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the Home screen is displayed.
    expect(find.byType(Home), findsOneWidget);

    // Tap on the ListTile.
    await tester.tap(find.byType(ListTile));
    await tester.pumpAndSettle();

    // Verify that the ListTarefas screen is displayed. aa
    expect(find.byType(ListTarefas), findsOneWidget);
  });


}
