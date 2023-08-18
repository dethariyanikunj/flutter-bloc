// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:block_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  _loginWidgetTest();
}

_loginWidgetTest() {
  testWidgets('Login widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that login screen have below widgets or not.
    expect(find.text('enter email'), findsOneWidget);
    expect(find.text('enter password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Please enter valid email address'), findsNothing);

    // check whether any widget is matching
    final emailField = find.ancestor(
      of: find.text('enter email'),
      matching: find.byType(TextField),
    );
    // enter text in text field
    await tester.enterText(emailField, 'text');
    // wait for 1 second
    await tester.pump(const Duration(microseconds: 1000));
    expect(find.text('Please enter valid email address'), findsOneWidget);

    // button tap event
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
  });
}
