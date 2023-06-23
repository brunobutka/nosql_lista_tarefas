// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nosql_lista_tarefas/add.dart';

import 'package:nosql_lista_tarefas/main.dart';
import 'package:nosql_lista_tarefas/list_tarefas.dart';

void main() {
  testWidgets('Navega para a tela ListTarefas', (WidgetTester tester) async {
    // Da build no APP.
    await tester.pumpWidget(MyApp());

    // Verifica se a tela Home é exibida
    expect(find.byType(Home), findsOneWidget);

    // Clica no ListTile.
    await tester.tap(find.byType(ListTile));
    await tester.pumpAndSettle();

    // Verifica se a tela ListTarefas é exibida.
    expect(find.byType(ListTarefas), findsOneWidget);
  });
}
