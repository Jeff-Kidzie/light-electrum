import 'package:flutter/material.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/app_button.dart';

class DetailBike extends StatelessWidget {
  const DetailBike({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bike Details')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildDetailSection(),
                    SizedBox(height: 16),
                    _buildCardDetail(),
                    SizedBox(height: 16),
                    _buildPriceDetail(),
                    SizedBox(height: 16),
                    _buildSpecifications(),
                    SizedBox(height: 16),
                    _buildFeatures(),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),
            AppButton(onPressed: () {}, label: 'Im Interested'),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection() => Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/electrumh5.webp',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Electrum H5',
            style: AppTextStyles.bold.copyWith(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'High-performance electric bike designed for urban commuting and recreational riding.',
            style: AppTextStyles.regular,
          ),
        ],
      ),
    ),
  );

  Widget _buildCardDetail() => Row(
    children: [
      Expanded(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Range', style: AppTextStyles.label),
                SizedBox(height: 8),
                Text(
                  '80km',
                  style: AppTextStyles.semiBold.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(width: 8),
      Expanded(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Range', style: AppTextStyles.label),
                SizedBox(height: 8),
                Text(
                  '80km',
                  style: AppTextStyles.semiBold.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );

  Widget _buildPriceDetail() => Card(
    child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rp 50.000', style: AppTextStyles.priceStyleBig),
            Text(
              'Pay as you go, billed per minute',
              style: AppTextStyles.label.copyWith(color: Color(0xFF555555)),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildSpecifications() => Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Specifications',
            style: AppTextStyles.semiBold.copyWith(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          _buildRowSpecs('Motor', '250W Brushless DC Motor'),
          SizedBox(height: 4),
          _buildRowSpecs('Battery', '36V 10Ah Lithium-ion'),
          SizedBox(height: 4),
          _buildRowSpecs('Max Speed', '25 km/h'),
          SizedBox(height: 4),
          _buildRowSpecs('Frame Material', 'Aluminum Alloy'),
          SizedBox(height: 8),
        ],
      ),
    ),
  );

  Widget _buildRowSpecs(String key, String value) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(key, style: AppTextStyles.regular),
      Text(value, style: AppTextStyles.semiBold.copyWith(color: Colors.black)),
    ],
  );

  Widget _buildFeatures() => Card();
}
