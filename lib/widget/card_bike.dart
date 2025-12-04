import 'package:flutter/material.dart';
import 'package:lightweight_electrum/data/bike.dart';
import 'package:lightweight_electrum/theme/app_color.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/chips.dart';

class CardBike extends StatelessWidget {
  final Bike bike;
  final VoidCallback? onTap;

  const CardBike({super.key, required this.bike, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  bike.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bike.name, style: AppTextStyles.title),
                    const SizedBox(height: 8),
                    Text(
                      'Range ${bike.range}',
                      style: AppTextStyles.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(bike.priceText, style: AppTextStyles.priceStyle),
                        Chips(
                          label: 'Available',
                          labelColor: Color(AppColors.secondary),
                          chipColor: Color(
                            AppColors.secondary,
                          ).withValues(alpha: 0.2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
