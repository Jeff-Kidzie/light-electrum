import 'package:flutter/material.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/app_button.dart';
import 'package:lightweight_electrum/widget/app_text_field.dart';
import 'package:lightweight_electrum/widget/card_bike.dart';

class BookFormScreen extends StatelessWidget {
  const BookFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book a Test Ride')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardBike(),
              SizedBox(height: 16),
              Text('Trip Details', style: AppTextStyles.title),
              SizedBox(height: 8),
              Text('Pickup date', style: AppTextStyles.bold),
              SizedBox(height: 8),
              _CardIcon(
                prefixIcon: Icons.calendar_today,
                onTap: () {
                  // Handle date selection
                  print('Date card tapped');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'June 25, 2024',
                      style: AppTextStyles.semiBold.copyWith(fontSize: 14),
                    ),
                    Text('Tap to change date', style: AppTextStyles.label),
                  ],
                ),
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
                  // Handle form submission
                  print('Submit request button pressed');
                },
                label: 'Submit request',
              ),
            ],
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
