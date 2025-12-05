abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final String username;
  final String email;
  final String password;

  RegisterButtonPressed({
    required this.username,
    required this.email,
    required this.password,
  });
}

class RegisterInputPassword extends RegisterEvent {
  final String password;

  RegisterInputPassword({required this.password});
}

class RegisterInputUsername extends RegisterEvent {
  final String username;

  RegisterInputUsername({required this.username});
}

class RegisterInputEmail extends RegisterEvent {
  final String email;

  RegisterInputEmail({required this.email});
}
