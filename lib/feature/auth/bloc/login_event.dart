abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}

class LoginInputPassword extends LoginEvent {
  final String password;

  LoginInputPassword({required this.password});
}

class LoginInputEmail extends LoginEvent {
  final String email;

  LoginInputEmail({required this.email});
}
