abstract class BookFormEvent {}

class BookFormInitialize extends BookFormEvent {}

class BookFormDateChanged extends BookFormEvent {
  final DateTime selectedDate;

  BookFormDateChanged(this.selectedDate);
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
