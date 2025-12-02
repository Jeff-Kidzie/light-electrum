import 'package:flutter/material.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';

class CardBike extends StatelessWidget {
  const CardBike({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/electrumh5.webp',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Electrum H5',
                  style: AppTextStyles.semiBold.copyWith(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Range 80km',
                  style: AppTextStyles.regular.copyWith(
                    fontSize: 16,
                    color: Color(0xFF555555),
                  ),
                ),
                SizedBox(height: 8),
                Text('Rp 50.000/hour', style: AppTextStyles.priceStyleBig),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String feature) => Row(
    children: [
      Icon(Icons.check, color: Colors.green, size: 16),
      SizedBox(width: 8),
      Text(feature, style: TextStyle(fontSize: 14)),
    ],
  );
}
