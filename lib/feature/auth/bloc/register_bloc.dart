import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:lightweight_electrum/feature/auth/bloc/register_event.dart';
import 'package:lightweight_electrum/feature/auth/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
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
      emit(RegisterErrorUsername(message: 'Full name is required'));
    } else if (username.length < 3) {
      emit(
        RegisterErrorUsername(message: 'Full name must be at least 3 characters'),
      );
    } else if (username.contains(RegExp(r'[0-9]'))) {
      emit(RegisterErrorUsername(message: 'Full name cannot contain numbers'));
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(username)) {
      emit(
        RegisterErrorUsername(
          message: 'Full name can only contain letters and spaces',
        ),
      );
    } else {
      emit(RegisterInitial());
    }
  }

  void _validatePassword(
    RegisterInputPassword event,
    Emitter<RegisterState> emit,
  ) {
    debugPrint('Validating password: ${event.password}');
    var password = event.password;

    if (password.isEmpty) {
      emit(RegisterErrorPassword(message: 'Password is required'));
    } else if (password.length < 8) {
      emit(
        RegisterErrorPassword(message: 'Password must be at least 8 characters'),
      );
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      emit(
        RegisterErrorPassword(
          message: 'Password must contain at least one uppercase letter',
        ),
      );
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      emit(
        RegisterErrorPassword(
          message: 'Password must contain at least one lowercase letter',
        ),
      );
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      emit(
        RegisterErrorPassword(
          message: 'Password must contain at least one number',
        ),
      );
    } else {
      emit(RegisterInitial());
    }
  }

  void _validateEmail(RegisterInputEmail event, Emitter<RegisterState> emit) {
    debugPrint('Validating email: ${event.email}');
    var email = event.email.trim();

    if (email.isEmpty) {
      emit(RegisterErrorEmail(message: 'Email address is required'));
    } else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email)) {
      emit(RegisterErrorEmail(message: 'Please enter a valid email address'));
    } else {
      emit(RegisterInitial());
    }
  }
}
