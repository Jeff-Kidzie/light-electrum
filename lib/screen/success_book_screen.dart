import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/app_button.dart';
import 'package:lottie/lottie.dart';

class SuccessBookScreen extends StatelessWidget {
  const SuccessBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                'assets/animations/success.json',
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 16),
            Text('Request Submitted', style: AppTextStyles.title),
            SizedBox(height: 8),
            Text(
              'Your ride request has been successfully submitted. We will contact you shortly to confirm the details.',
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            _CardBookDetail(),
            Spacer(),
            AppButton(
              onPressed: () {
                context.go('/home');
              },
              label: 'Back to Home',
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _CardBookDetail extends StatelessWidget {
  const _CardBookDetail();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Booking Details', style: AppTextStyles.semiBold),
            SizedBox(height: 8),
            Text('Bike: Electrum H5', style: AppTextStyles.regular),
            SizedBox(height: 4),
            Text('Pickup Date: June 25, 2024', style: AppTextStyles.regular),
            SizedBox(height: 4),
            Text('Full Name: John Doe', style: AppTextStyles.regular),
            SizedBox(height: 4),
            Text('Email: john.doe@example.com', style: AppTextStyles.regular),
          ],
        ),
      ),
    );
  }
}
