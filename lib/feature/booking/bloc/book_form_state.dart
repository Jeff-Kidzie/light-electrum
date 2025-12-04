abstract class BookFormState {}

class BookFormInitial extends BookFormState {}

class BookFormLoaded extends BookFormState {
  final DateTime selectedDate;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String? fullNameError;
  final String? emailError;
  final bool isFormValid;

  BookFormLoaded({
    required this.selectedDate,
    this.fullName = '',
    this.email = '',
    this.phoneNumber = '',
    this.fullNameError,
    this.emailError,
    this.isFormValid = false,
  });

  BookFormLoaded copyWith({
    DateTime? selectedDate,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? fullNameError,
    String? emailError,
    bool? isFormValid,
  }) {
    return BookFormLoaded(
      selectedDate: selectedDate ?? this.selectedDate,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fullNameError: fullNameError,
      emailError: emailError,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}

class BookFormSubmitting extends BookFormState {}

class BookFormSuccess extends BookFormState {}

class BookFormError extends BookFormState {
  final String message;

  BookFormError(this.message);
}
