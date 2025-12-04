import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightweight_electrum/feature/booking/bloc/book_form_event.dart';
import 'package:lightweight_electrum/feature/booking/bloc/book_form_state.dart';

class BookFormBloc extends Bloc<BookFormEvent, BookFormState> {
  BookFormBloc() : super(BookFormInitial()) {
    on<BookFormInitialize>(_onInitialize);
    on<BookFormDateChanged>(_onDateChanged);
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
    emit(BookFormLoaded(selectedDate: event.selectedDate));
  }

  Future<void> _onSubmitted(
    BookFormSubmitted event,
    Emitter<BookFormState> emit,
  ) async {
    try {
      emit(BookFormSubmitting());
      // TODO: Implement booking submission logic
      await Future.delayed(const Duration(seconds: 1));
      emit(BookFormSuccess());
    } catch (e) {
      emit(BookFormError('Failed to submit booking: $e'));
    }
  }
}
