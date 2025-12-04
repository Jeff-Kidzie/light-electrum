abstract class BookFormEvent {}

class BookFormInitialize extends BookFormEvent {}

class BookFormDateChanged extends BookFormEvent {
  final DateTime selectedDate;

  BookFormDateChanged(this.selectedDate);
}

class BookFormFullNameChanged extends BookFormEvent {
  final String fullName;

  BookFormFullNameChanged(this.fullName);
}

class BookFormEmailChanged extends BookFormEvent {
  final String email;

  BookFormEmailChanged(this.email);
}

class BookFormPhoneChanged extends BookFormEvent {
  final String phoneNumber;

  BookFormPhoneChanged(this.phoneNumber);
}

class BookFormSubmitted extends BookFormEvent {
  final String fullName;
  final String email;
  final String phoneNumber;
  final DateTime pickupDate;

  BookFormSubmitted({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.pickupDate,
  });
}
