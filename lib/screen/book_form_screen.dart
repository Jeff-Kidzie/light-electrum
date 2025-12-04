import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lightweight_electrum/data/bike_detail.dart';
import 'package:lightweight_electrum/feature/booking/bloc/book_form_bloc.dart';
import 'package:lightweight_electrum/feature/booking/bloc/book_form_event.dart';
import 'package:lightweight_electrum/feature/booking/bloc/book_form_state.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/app_button.dart';
import 'package:lightweight_electrum/widget/app_text_field.dart';
import 'package:lightweight_electrum/widget/calendar_dialog.dart';
import 'package:lightweight_electrum/widget/card_bike.dart';

class BookFormScreen extends StatelessWidget {
  final Map<String, dynamic> bikeDetailJson;
  const BookFormScreen({super.key, required this.bikeDetailJson});

  @override
  Widget build(BuildContext context) {
    final bikeDetail = BikeDetail.fromJson(bikeDetailJson);
    return BlocProvider(
      create: (context) => BookFormBloc()..add(BookFormInitialize()),
      child: BlocListener<BookFormBloc, BookFormState>(
        listener: (context, state) {
          if (state is BookFormSuccess) {
            context.go('/success-book');
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
            title: const Text('Book a Test Ride'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardBike(bike: bikeDetail),
                  SizedBox(height: 16),
                  Text('Trip Details', style: AppTextStyles.title),
                  SizedBox(height: 8),
                  Text('Pickup date', style: AppTextStyles.bold),
                  SizedBox(height: 8),
                  BlocBuilder<BookFormBloc, BookFormState>(
                    builder: (blocContext, state) {
                      if (state is BookFormLoaded) {
                        return _CardIcon(
                          prefixIcon: Icons.calendar_today,
                          onTap: () {
                            final bloc = blocContext.read<BookFormBloc>();
                            showDialog(
                              context: context,
                              builder: (dialogContext) => CalendarDialog(
                                initialDate: state.selectedDate,
                                onDateSelected: (date) {
                                  bloc.add(BookFormDateChanged(date));
                                },
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat(
                                  'MMM dd, yyyy',
                                ).format(state.selectedDate),
                                style: AppTextStyles.semiBold.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Tap to change date',
                                style: AppTextStyles.label,
                              ),
                            ],
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                  SizedBox(height: 24),
                  Text('Contact Details', style: AppTextStyles.title),
                  SizedBox(height: 8),
                  BlocBuilder<BookFormBloc, BookFormState>(
                    builder: (blocContext, state) {
                      if (state is BookFormLoaded) {
                        return Column(
                          children: [
                            AppTextField(
                              title: 'Full Name',
                              hintText: 'Enter your full name',
                              prefixIcon: Icon(Icons.person_outline),
                              errorText: state.fullNameError,
                              onChanged: (value) {
                                blocContext.read<BookFormBloc>().add(
                                  BookFormFullNameChanged(value),
                                );
                              },
                            ),
                            SizedBox(height: 16),
                            AppTextField(
                              title: 'Email Address',
                              hintText: 'Enter your email address',
                              prefixIcon: Icon(Icons.email_outlined),
                              errorText: state.emailError,
                              onChanged: (value) {
                                blocContext.read<BookFormBloc>().add(
                                  BookFormEmailChanged(value),
                                );
                              },
                            ),
                            SizedBox(height: 16),
                            AppTextField(
                              title: 'Phone Number',
                              hintText: 'Enter your phone number',
                              prefixIcon: Icon(Icons.phone_outlined),
                              onChanged: (value) {
                                blocContext.read<BookFormBloc>().add(
                                  BookFormPhoneChanged(value),
                                );
                              },
                            ),
                            SizedBox(height: 32),
                            AppButton(
                              onPressed: state.isFormValid
                                  ? () {
                                      blocContext.read<BookFormBloc>().add(
                                        BookFormSubmitted(
                                          fullName: state.fullName,
                                          email: state.email,
                                          phoneNumber: state.phoneNumber,
                                          pickupDate: state.selectedDate,
                                        ),
                                      );
                                    }
                                  : null,
                              label: 'Submit request',
                            ),
                          ],
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CardIcon extends StatelessWidget {
  final IconData prefixIcon;
  final Widget child;
  final VoidCallback? onTap;

  const _CardIcon({required this.prefixIcon, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(prefixIcon, color: Colors.grey),
              SizedBox(width: 16),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
