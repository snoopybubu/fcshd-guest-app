class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = "An Unknown Error Occured. Please try again later."]);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {

      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
            'Invalid account. Please contact our staff for further assistance.');

      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
            'Account disabled. Please contact our staff for further assistance.');

      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
            'Invalid account. Please contact our staff for further assistance.');

      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
            "Invalid password. Please try again.");
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}
