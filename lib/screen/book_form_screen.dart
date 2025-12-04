import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: Scaffold(
        appBar: AppBar(title: const Text('Book a Test Ride')),
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
                AppTextField(
                  title: 'Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                SizedBox(height: 16),
                AppTextField(
                  title: 'Email Address',
                  hintText: 'Enter your email address',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                SizedBox(height: 16),
                AppTextField(
                  title: 'Phone Number',
                  hintText: 'Enter your phone number',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                SizedBox(height: 32),
                AppButton(
                  onPressed: () {
                    // TODO: Get form values and submit
                    context.read<BookFormBloc>().add(
                      BookFormSubmitted(
                        fullName: '',
                        email: '',
                        phoneNumber: '',
                        pickupDate: DateTime.now(),
                      ),
                    );
                  },
                  label: 'Submit request',
                ),
              ],
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
