class ValidationUtils {
  bool isValidFields(String email, String pass) {
    return isValidEmail(email) && isValidPassword(pass);
  }

  bool isValidEmail(String email) {
    return email.isNotEmpty && email.contains('@');
  }

  bool isValidPassword(String password) {
    return password.isNotEmpty && password.length >= 8;
  }
}
