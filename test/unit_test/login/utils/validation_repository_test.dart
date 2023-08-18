import 'package:block_example/login/utils/validation_utils.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Login Validation tests', () {
    final operations = ValidationUtils();

    _emailValidationTest(operations);

    _passwordValidationTest(operations);

    _fieldValidationTest(operations);
  });
}

_emailValidationTest(ValidationUtils operations) {
  test('Email Id validation test', () {
    final invalidEmailTest = operations.isValidEmail('email');
    expect(invalidEmailTest, false);
    final validEmailTest = operations.isValidEmail('email@gmail.com');
    expect(validEmailTest, true);
  });
}

_passwordValidationTest(ValidationUtils operations) {
  test('Password validation test', () {
    final invalidPasswordTest = operations.isValidPassword('pass');
    expect(invalidPasswordTest, false);
    final validPasswordTest = operations.isValidPassword('password@123');
    expect(validPasswordTest, true);
  });
}

_fieldValidationTest(ValidationUtils operations) {
  test('Field validation test', () {
    final invalidFieldsTest = operations.isValidFields('email', 'pass');
    expect(invalidFieldsTest, false);
    final validFieldsTest =
        operations.isValidFields('email@gmail.com', 'password@123');
    expect(validFieldsTest, true);
  });
}
