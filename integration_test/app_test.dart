import 'package:block_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Login Screen test', (tester) async {
    await tester.pumpWidget(const MyApp());
    const defaultWaitTime = 2; // 2 sec
    final emailField = find.text('enter email');
    final passwordField = find.text('enter password');
    final loginText = find.text('Login');
    final disabledLoginButtonFinder = find.byType(ElevatedButton);
    final disabledLoginButton = tester.widget<ElevatedButton>(
      disabledLoginButtonFinder,
    );
    final states = <MaterialState>{};

    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(loginText, findsOneWidget);
    expect(find.text('Please enter valid email address'), findsNothing);
    expect(disabledLoginButton.style?.backgroundColor?.resolve(states),
        Colors.grey);
    expect(find.byType(CircularProgressIndicator), findsNothing);

    final emailTextField = find.ancestor(
      of: find.text('enter email'),
      matching: find.byType(TextField),
    );
    await tester.tap(emailTextField);
    await tester.enterText(emailTextField, 'text');
    await tester.pump(const Duration(seconds: defaultWaitTime));
    expect(find.text('Please enter valid email address'), findsOneWidget);

    final passwordTextField = find.ancestor(
      of: find.text('enter password'),
      matching: find.byType(TextField),
    );
    await tester.tap(passwordTextField);
    await tester.enterText(passwordTextField, 'text');
    await tester.pump(const Duration(seconds: defaultWaitTime));
    expect(find.text('Please enter valid password'), findsAtLeastNWidgets(1));

    await tester.tap(emailTextField);
    await tester.enterText(emailTextField, 'abc@gmail.com');
    await tester.pump(const Duration(seconds: defaultWaitTime));
    expect(find.text('Please enter valid email address'), findsNothing);

    await tester.tap(passwordTextField);
    await tester.enterText(passwordTextField, 'text@123');
    await tester.pump(const Duration(seconds: defaultWaitTime));
    expect(find.text('Please enter valid password'), findsNothing);

    final enabledLoginButtonFinder = find.byType(ElevatedButton);
    final enabledLoginButton = tester.widget<ElevatedButton>(
      enabledLoginButtonFinder,
    );
    expect(
      enabledLoginButton.style?.backgroundColor?.resolve(states),
      Colors.blue,
    );
    await tester.tap(disabledLoginButtonFinder);
    await tester.pump(const Duration(seconds: defaultWaitTime));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
