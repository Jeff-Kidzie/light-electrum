import 'package:flutter/material.dart';
import 'package:lightweight_electrum/theme/app_color.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/app_button.dart';
import 'package:lightweight_electrum/widget/app_text_field.dart';

class DesignComponentScreen extends StatelessWidget {
  const DesignComponentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Design Components')),
      backgroundColor: Color(AppColors.background),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppButton(onPressed: () {}, label: 'Create Account'),
              SizedBox(height: 16),
              AppTextField(
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 16),
              AppTextField(
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 16),
              Text('This is h1', style: AppTextStyles.heading1),
              SizedBox(height: 8),
              Text('This is h2', style: AppTextStyles.heading2),
              SizedBox(height: 8),
              Text('This is body text', style: AppTextStyles.bodyLarge),
              SizedBox(height: 8),
              Text('This is medium text', style: AppTextStyles.bodyMedium),
              SizedBox(height: 8),
              Text('This is label text', style: AppTextStyles.label),
            ],
          ),
        ),
      ),
    );
  }
}
