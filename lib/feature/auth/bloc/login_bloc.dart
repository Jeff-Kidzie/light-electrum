import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:lightweight_electrum/feature/auth/bloc/login_event.dart';
import 'package:lightweight_electrum/feature/auth/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  String? _emailError;
  String? _passwordError;

  LoginBloc(super.initialState) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      // Simulate a login process
      await Future.delayed(Duration(seconds: 2));
      emit(LoginSuccess());
    });

    on<LoginInputPassword>(_validatePassword);
    on<LoginInputEmail>(_validateEmail);
  }

  void _validatePassword(LoginInputPassword event, Emitter<LoginState> emit) {
    debugPrint('Validating password: ${event.password}');
    var password = event.password;

    if (password.isEmpty) {
      _passwordError = 'Password is required';
      _isPasswordValid = false;
    } else if (password.length < 8) {
      _passwordError = 'Password must be at least 8 characters';
      _isPasswordValid = false;
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      _passwordError = 'Password must contain at least one uppercase letter';
      _isPasswordValid = false;
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      _passwordError = 'Password must contain at least one lowercase letter';
      _isPasswordValid = false;
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      _passwordError = 'Password must contain at least one number';
      _isPasswordValid = false;
    } else {
      _passwordError = null;
      _isPasswordValid = true;
    }

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
    var email = event.email.trim();

    if (email.isEmpty) {
      _emailError = 'Email address is required';
      _isEmailValid = false;
    } else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email)) {
      _emailError = 'Please enter a valid email address';
      _isEmailValid = false;
    } else {
      _emailError = null;
      _isEmailValid = true;
    }

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
