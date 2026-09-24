import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:concepts_demo_app/main.dart';

void main() {
  testWidgets('App loads home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('HomeScreen'), findsOneWidget);
    expect(find.text('User Input & Forms'), findsOneWidget);
  });
}
