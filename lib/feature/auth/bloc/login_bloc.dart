import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:lightweight_electrum/feature/auth/bloc/login_event.dart';
import 'package:lightweight_electrum/feature/auth/bloc/login_state.dart';
import 'package:lightweight_electrum/service/auth_service.dart';
import 'package:lightweight_electrum/utils/validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService = AuthService();
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  String? _emailError;
  String? _passwordError;
  String _email = '';
  String _password = '';

  LoginBloc(super.initialState) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        await _authService.login(email: event.email, password: event.password);
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(message: e.toString()));
      }
    });

    on<LoginInputPassword>(_validatePassword);
    on<LoginInputEmail>(_validateEmail);
  }

  String get emailValue => _email;
  String get passwordValue => _password;

  void _validatePassword(LoginInputPassword event, Emitter<LoginState> emit) {
    debugPrint('Validating password: ${event.password}');
    _password = event.password;
    _passwordError = Validators.validatePassword(event.password);
    _isPasswordValid = _passwordError == null;

    emit(
      LoginValidState(
        isEmailValid: _isEmailValid,
        isPasswordValid: _isPasswordValid,
        emailError: _emailError,
        passwordError: _passwordError,
      ),
    );
  }

  void _validateEmail(LoginInputEmail event, Emitter<LoginState> emit) {
    debugPrint('Validating email: ${event.email}');
    _email = event.email;
    _emailError = Validators.validateEmail(event.email);
    _isEmailValid = _emailError == null;

    emit(
      LoginValidState(
        isEmailValid: _isEmailValid,
        isPasswordValid: _isPasswordValid,
        emailError: _emailError,
        passwordError: _passwordError,
      ),
    );
  }
}
