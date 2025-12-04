import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightweight_electrum/feature/booking/bloc/book_form_event.dart';
import 'package:lightweight_electrum/feature/booking/bloc/book_form_state.dart';

class BookFormBloc extends Bloc<BookFormEvent, BookFormState> {
  BookFormBloc() : super(BookFormInitial()) {
    on<BookFormInitialize>(_onInitialize);
    on<BookFormDateChanged>(_onDateChanged);
    on<BookFormFullNameChanged>(_onFullNameChanged);
    on<BookFormEmailChanged>(_onEmailChanged);
    on<BookFormPhoneChanged>(_onPhoneChanged);
    on<BookFormSubmitted>(_onSubmitted);
  }

  Future<void> _onInitialize(
    BookFormInitialize event,
    Emitter<BookFormState> emit,
  ) async {
    emit(BookFormLoaded(selectedDate: DateTime.now()));
  }

  Future<void> _onDateChanged(
    BookFormDateChanged event,
    Emitter<BookFormState> emit,
  ) async {
    final currentState = state as BookFormLoaded;
    emit(currentState.copyWith(selectedDate: event.selectedDate));
  }

  Future<void> _onFullNameChanged(
    BookFormFullNameChanged event,
    Emitter<BookFormState> emit,
  ) async {
    final currentState = state as BookFormLoaded;
    final validation = _validateFullName(event.fullName);

    emit(
      currentState.copyWith(
        fullName: event.fullName,
        fullNameError: validation,
        isFormValid: _isFormValid(
          fullName: event.fullName,
          fullNameError: validation,
          email: currentState.email,
          emailError: currentState.emailError,
          phoneNumber: currentState.phoneNumber,
        ),
      ),
    );
  }

  Future<void> _onEmailChanged(
    BookFormEmailChanged event,
    Emitter<BookFormState> emit,
  ) async {
    final currentState = state as BookFormLoaded;
    final validation = _validateEmail(event.email);

    emit(
      currentState.copyWith(
        email: event.email,
        emailError: validation,
        isFormValid: _isFormValid(
          fullName: currentState.fullName,
          fullNameError: currentState.fullNameError,
          email: event.email,
          emailError: validation,
          phoneNumber: currentState.phoneNumber,
        ),
      ),
    );
  }

  Future<void> _onPhoneChanged(
    BookFormPhoneChanged event,
    Emitter<BookFormState> emit,
  ) async {
    final currentState = state as BookFormLoaded;
    emit(
      currentState.copyWith(
        phoneNumber: event.phoneNumber,
        isFormValid: _isFormValid(
          fullName: currentState.fullName,
          fullNameError: currentState.fullNameError,
          email: currentState.email,
          emailError: currentState.emailError,
          phoneNumber: event.phoneNumber,
        ),
      ),
    );
  }

  Future<void> _onSubmitted(
    BookFormSubmitted event,
    Emitter<BookFormState> emit,
  ) async {
    try {
      emit(BookFormSubmitting());
      // Simulate booking submission
      await Future.delayed(const Duration(seconds: 1));
      emit(BookFormSuccess());
    } catch (e) {
      emit(BookFormError('Failed to submit booking: $e'));
    }
  }

  String? _validateFullName(String fullName) {
    debugPrint('Validating full name: $fullName');
    var name = fullName.trim();

    if (name.isEmpty) {
      return 'Full name is required';
    } else if (name.length < 3) {
      return 'Full name must be at least 3 characters';
    } else if (name.contains(RegExp(r'[0-9]'))) {
      return 'Full name cannot contain numbers';
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
      return 'Full name can only contain letters and spaces';
    }
    return null;
  }

  String? _validateEmail(String email) {
    debugPrint('Validating email: $email');
    var emailTrimmed = email.trim();

    if (emailTrimmed.isEmpty) {
      return 'Email address is required';
    } else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(emailTrimmed)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  bool _isFormValid({
    required String fullName,
    required String? fullNameError,
    required String email,
    required String? emailError,
    required String phoneNumber,
  }) {
    return fullName.isNotEmpty &&
        fullNameError == null &&
        email.isNotEmpty &&
        emailError == null &&
        phoneNumber.isNotEmpty;
  }
}
