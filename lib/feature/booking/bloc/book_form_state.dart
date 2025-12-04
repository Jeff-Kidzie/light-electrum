abstract class BookFormState {}

class BookFormInitial extends BookFormState {}

class BookFormLoaded extends BookFormState {
  final DateTime selectedDate;

  BookFormLoaded({required this.selectedDate});
}

class BookFormSubmitting extends BookFormState {}

class BookFormSuccess extends BookFormState {}

class BookFormError extends BookFormState {
  final String message;

  BookFormError(this.message);
}
