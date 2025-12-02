// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
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
                Text(
                  title,
                  style: AppTextStyles.semiBold.copyWith(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Text(
                  subtitle,
                  style: AppTextStyles.semiBold.copyWith(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(price, style: AppTextStyles.priceStyleBig),
            SizedBox(height: 8),
            Chips(
              label: 'Pay as you go',
              labelColor: Colors.grey,
              chipColor: Colors.grey.shade200,
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
