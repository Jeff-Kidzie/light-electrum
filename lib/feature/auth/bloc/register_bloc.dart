import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:lightweight_electrum/feature/auth/bloc/register_event.dart';
import 'package:lightweight_electrum/feature/auth/bloc/register_state.dart';
import 'package:lightweight_electrum/service/auth_service.dart';
import 'package:lightweight_electrum/utils/validators.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthService _authService = AuthService();
  bool _isUsernameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  String? _usernameError;
  String? _emailError;
  String? _passwordError;
  String _email = '';
  String _password = '';

  RegisterBloc(super.initialState) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());
      try {
        await _authService.register(
          email: event.email,
          password: event.password,
        );
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterFailure(message: e.toString()));
      }
    });

    on<RegisterInputUsername>(_validateUserName);
    on<RegisterInputPassword>(_validatePassword);
    on<RegisterInputEmail>(_validateEmail);
  }

  String get emailValue => _email;
  String get passwordValue => _password;

  void _validateUserName(
    RegisterInputUsername event,
    Emitter<RegisterState> emit,
  ) {
    debugPrint('Validating username: ${event.username}');
    _usernameError = Validators.validateFullName(event.username);
    _isUsernameValid = _usernameError == null;

    emit(
      RegisterValidState(
        isUsernameValid: _isUsernameValid,
        isEmailValid: _isEmailValid,
        isPasswordValid: _isPasswordValid,
        usernameError: _usernameError,
        emailError: _emailError,
        passwordError: _passwordError,
      ),
    );
  }

  void _validatePassword(
    RegisterInputPassword event,
    Emitter<RegisterState> emit,
  ) {
    debugPrint('Validating password: ${event.password}');
    _password = event.password;
    _passwordError = Validators.validatePassword(event.password);
    _isPasswordValid = _passwordError == null;

    emit(
      RegisterValidState(
        isUsernameValid: _isUsernameValid,
        isEmailValid: _isEmailValid,
        isPasswordValid: _isPasswordValid,
        usernameError: _usernameError,
        emailError: _emailError,
        passwordError: _passwordError,
      ),
    );
  }

  void _validateEmail(RegisterInputEmail event, Emitter<RegisterState> emit) {
    debugPrint('Validating email: ${event.email}');
    _email = event.email;
    _emailError = Validators.validateEmail(event.email);
    _isEmailValid = _emailError == null;

    emit(
      RegisterValidState(
        isUsernameValid: _isUsernameValid,
        isEmailValid: _isEmailValid,
        isPasswordValid: _isPasswordValid,
        usernameError: _usernameError,
        emailError: _emailError,
        passwordError: _passwordError,
      ),
    );
  }
}
