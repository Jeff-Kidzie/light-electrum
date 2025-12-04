import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lightweight_electrum/domain/get_bike_detail_use_case.dart';
import 'package:lightweight_electrum/feature/home/bloc/bike_detail_bloc.dart';
import 'package:lightweight_electrum/feature/home/bloc/bike_detail_event.dart';
import 'package:lightweight_electrum/feature/home/bloc/bike_detail_state.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/app_button.dart';

class BikeDetailScreen extends StatelessWidget {
  final String bikeId;

  const BikeDetailScreen({super.key, required this.bikeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BikeDetailBloc(getBikeDetailUseCase: GetBikeDetailUseCase())
            ..add(BikeDetailLoadData(bikeId)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Bike Details')),
        body: BlocBuilder<BikeDetailBloc, BikeDetailState>(
          builder: (context, state) {
            if (state is BikeDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is BikeDetailError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      label: 'Retry',
                      onPressed: () {
                        context.read<BikeDetailBloc>().add(
                          BikeDetailRefreshData(bikeId),
                        );
                      },
                    ),
                  ],
                ),
              );
            }

            if (state is BikeDetailLoaded) {
              final bike = state.bikeDetail;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bike Image
                    Image.asset(
                      bike.imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                      cacheWidth: 800,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title and Rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  bike.name,
                                  style: AppTextStyles.title.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    bike.rating.toString(),
                                    style: AppTextStyles.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            bike.model,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Description
                          Text(
                            bike.description,
                            style: AppTextStyles.bodyMedium,
                          ),
                          const SizedBox(height: 24),

                          // Stats
                          Text(
                            'Quick Stats',
                            style: AppTextStyles.title.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: bike.stats.map((stat) {
                              return Expanded(
                                child: _buildStatCard(stat.label, stat.value),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 24),

                          // Pricing
                          Text(
                            'Pricing',
                            style: AppTextStyles.title.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          _buildPricingCard(bike.pricing),
                          SizedBox(height: 24),

                          // Features
                          Text(
                            'Features',
                            style: AppTextStyles.title.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...bike.features.map(
                            (feature) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      feature,
                                      style: AppTextStyles.bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 24),

                          // Specifications
                          Text(
                            'Specifications',
                            style: AppTextStyles.title.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          _buildSpecificationsCard(bike.specifications),
                          SizedBox(height: 24),

                          // Book Now Button
                          SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              label: 'Book Now - ${bike.pricing.priceText}',
                              onPressed: () {
                                // Navigate to book form with bike detail
                                context.go('/book-form', extra: bike.toJson());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return const Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: AppTextStyles.title.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingCard(dynamic pricing) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPricingRow('Per Hour', 'Rp ${pricing.perHour}'),
            const Divider(),
            _buildPricingRow('Per Day', 'Rp ${pricing.perDay}'),
            const Divider(),
            _buildPricingRow('Per Week', 'Rp ${pricing.perWeek}'),
            const SizedBox(height: 12),
            Text(
              pricing.billingInfo,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey[600],
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingRow(String label, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.bodyMedium),
          Text(
            price,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationsCard(dynamic specifications) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSpecRow('Motor', specifications.motor),
            _buildSpecRow('Battery', specifications.battery),
            _buildSpecRow('Max Speed', specifications.maxSpeed),
            _buildSpecRow('Frame Material', specifications.frameMaterial),
            _buildSpecRow('Weight', specifications.weight),
            _buildSpecRow('Max Load', specifications.maxLoad),
            _buildSpecRow('Brakes', specifications.brakes),
            _buildSpecRow('Tires', specifications.tires),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: AppTextStyles.title.copyWith(color: Colors.grey[700]),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
