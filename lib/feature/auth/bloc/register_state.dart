abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterErrorPassword extends RegisterState {
  final String message;
  RegisterErrorPassword({required this.message});
}

class RegisterErrorUsername extends RegisterState {
  final String message;
  RegisterErrorUsername({required this.message});
}

class RegisterErrorEmail extends RegisterState {
  final String message;
  RegisterErrorEmail({required this.message});
}

class RegisterValidState extends RegisterState {
  final bool isUsernameValid;
  final bool isEmailValid;
  final bool isPasswordValid;
  final String? usernameError;
  final String? emailError;
  final String? passwordError;

  RegisterValidState({
    required this.isUsernameValid,
    required this.isEmailValid,
    required this.isPasswordValid,
    this.usernameError,
    this.emailError,
    this.passwordError,
  });

  bool get isFormValid => isUsernameValid && isEmailValid && isPasswordValid;
}
