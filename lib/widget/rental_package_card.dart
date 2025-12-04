// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lightweight_electrum/theme/app_color.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/chips.dart';

class RentalPackageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final List<String>? features;

  const RentalPackageCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: AppTextStyles.title),
                Spacer(),
                Text(subtitle, style: AppTextStyles.regular),
              ],
            ),
            SizedBox(height: 8),
            Text(price, style: AppTextStyles.priceStyle),
            SizedBox(height: 8),
            Chips(
              label: 'Pay as you go',
              labelColor: Color(0xFF555555),
              chipColor: Color(AppColors.background),
            ),
            // Text(
            //   'Details about the rental package go here.',
            //   style: Theme.of(context).textTheme.bodyText2,
            // ),
          ],
        ),
      ),
    );
  }
}
