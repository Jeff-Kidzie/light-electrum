import 'package:flutter/material.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';

class Chips extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color chipColor;

  const Chips({
    super.key,
    required this.label,
    required this.labelColor,
    required this.chipColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
        label,
        style: AppTextStyles.semiBold.copyWith(color: labelColor, fontSize: 11),
      ),
    );
  }
}
