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
