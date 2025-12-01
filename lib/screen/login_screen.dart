import 'package:flutter/material.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/app_button.dart';
import 'package:lightweight_electrum/widget/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Electrum')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create your account', style: AppTextStyles.heading1),
            SizedBox(height: 16),
            Text(
              'Set up your account to get started with Lightweight Electrum.',
              style: AppTextStyles.bodyMedium,
            ),
            SizedBox(height: 32),
            _buildCardAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCardAccount(BuildContext context) => Card(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Full name', style: AppTextStyles.label),
          SizedBox(height: 8),
          AppTextField(hintText: 'Full name', prefixIcon: Icon(Icons.person)),
          SizedBox(height: 16),
          Text('Email Address', style: AppTextStyles.label),
          SizedBox(height: 8),
          AppTextField(
            hintText: 'Email Address',
            prefixIcon: Icon(Icons.email),
          ),
          SizedBox(height: 24),
          AppButton(onPressed: () {}, label: 'Create account'),
          SizedBox(height: 16),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'Already have an account? ',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Log in',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
