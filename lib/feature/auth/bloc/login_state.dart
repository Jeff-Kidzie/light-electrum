abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}

class LoginErrorPassword extends LoginState {
  final String message;
  LoginErrorPassword({required this.message});
}

class LoginErrorEmail extends LoginState {
  final String message;
  LoginErrorEmail({required this.message});
}

class LoginValidState extends LoginState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final String? emailError;
  final String? passwordError;

  LoginValidState({
    required this.isEmailValid,
    required this.isPasswordValid,
    this.emailError,
    this.passwordError,
  });

  bool get isFormValid => isEmailValid && isPasswordValid;
}
