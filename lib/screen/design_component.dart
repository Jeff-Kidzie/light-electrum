import 'package:flutter/material.dart';
import 'package:lightweight_electrum/theme/app_color.dart';
import 'package:lightweight_electrum/widget/app_button.dart';
import 'package:lightweight_electrum/widget/app_text_field.dart';
import 'package:lightweight_electrum/widget/card_bike.dart';
import 'package:lightweight_electrum/widget/chips.dart';
import 'package:lightweight_electrum/widget/promotion_card.dart';
import 'package:lightweight_electrum/widget/rental_package_card.dart';

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
              AppButton(
                onPressed: () {},
                label: 'Create Account',
                isLoading: true,
              ),
              SizedBox(height: 16),
              AppTextField(
                title: 'Email Address',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 16),
              AppTextField(
                title: 'Full Name',
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person),
              ),
              // SizedBox(height: 16),
              // Text('This is h1', style: AppTextStyles.heading1),
              // SizedBox(height: 8),
              // Text('This is h2', style: AppTextStyles.heading2),
              // SizedBox(height: 8),
              // Text('This is body text', style: AppTextStyles.bodyLarge),
              // SizedBox(height: 8),
              // Text('This is medium text', style: AppTextStyles.bodyMedium),
              // SizedBox(height: 8),
              // Text('This is label text', style: AppTextStyles.label),
              SizedBox(height: 8),
              Chips(
                label: 'Weekend special',
                labelColor: Colors.white,
                chipColor: Color(AppColors.secondary),
              ),
              SizedBox(height: 8),
              Chips(
                label: 'Available Now',
                labelColor: Color(AppColors.secondary),
                chipColor: Color(AppColors.secondary).withOpacity(0.1),
              ),
              SizedBox(height: 16),
              PromotionCard(
                label: 'Weekend special',
                labelColor: Colors.white,
                chipColor: Color(AppColors.secondary),
                title: 'Premium Plan',
                description:
                    'Get unlimited access to all features with our Premium Plan.',
                buttonText: 'Subscribe Now',
                discountText: '20% OFF',
                priceText: '\$9.99/month',
                onButtonPressed: () {},
              ),
              SizedBox(height: 16),
              RentalPackageCard(
                title: 'Hourly Flex',
                subtitle: 'Up to 4 hours',
                price: 'Rp 70.000/hour',
              ),
              SizedBox(height: 16),
              CardBike(),
            ],
          ),
        ),
      ),
    );
  }
}
