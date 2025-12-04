// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lightweight_electrum/theme/app_color.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/app_button.dart';
import 'package:lightweight_electrum/widget/chips.dart';

class PromotionCard extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color chipColor;
  final String title;
  final String description;
  final String buttonText;
  final String? discountText;
  final String priceText;
  final VoidCallback onButtonPressed;

  const PromotionCard({
    super.key,
    required this.label,
    required this.labelColor,
    required this.chipColor,
    required this.title,
    required this.description,
    required this.buttonText,
    this.discountText,
    required this.priceText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Chips(
                  label: label,
                  labelColor: labelColor,
                  chipColor: chipColor,
                ),
                Spacer(),
                if (discountText != null)
                  Text(
                    discountText!,
                    style: AppTextStyles.label.copyWith(
                      color: Color(AppColors.primary),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text(title, style: AppTextStyles.title),
            SizedBox(height: 8),
            Text(description, style: AppTextStyles.bodyMedium),
            SizedBox(height: 8),
            Row(
              children: [
                AppButton(
                  onPressed: onButtonPressed,
                  label: buttonText,
                  fullWidth: false,
                ),
                Spacer(),
                Text(
                  priceText,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
