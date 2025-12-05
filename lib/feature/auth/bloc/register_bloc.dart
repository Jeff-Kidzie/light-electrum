import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:lightweight_electrum/feature/auth/bloc/register_event.dart';
import 'package:lightweight_electrum/feature/auth/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  bool _isUsernameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  String? _usernameError;
  String? _emailError;
  String? _passwordError;

  RegisterBloc(super.initialState) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());
      // Simulate a Register process
      await Future.delayed(Duration(seconds: 2));
      emit(RegisterSuccess());
    });

    on<RegisterInputUsername>(_validateUserName);
    on<RegisterInputPassword>(_validatePassword);
    on<RegisterInputEmail>(_validateEmail);
  }

  void _validateUserName(
    RegisterInputUsername event,
    Emitter<RegisterState> emit,
  ) {
    debugPrint('Validating username: ${event.username}');
    var username = event.username.trim();

    if (username.isEmpty) {
      _usernameError = 'Full name is required';
      _isUsernameValid = false;
    } else if (username.length < 3) {
      _usernameError = 'Full name must be at least 3 characters';
      _isUsernameValid = false;
    } else if (username.contains(RegExp(r'[0-9]'))) {
      _usernameError = 'Full name cannot contain numbers';
      _isUsernameValid = false;
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(username)) {
      _usernameError = 'Full name can only contain letters and spaces';
      _isUsernameValid = false;
    } else {
      _usernameError = null;
      _isUsernameValid = true;
    }

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
