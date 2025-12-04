import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lightweight_electrum/feature/home/bloc/home_bloc.dart';
import 'package:lightweight_electrum/feature/home/bloc/home_event.dart';
import 'package:lightweight_electrum/feature/home/bloc/home_state.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/card_bike.dart';
import 'package:lightweight_electrum/widget/promotion_card.dart';
import 'package:lightweight_electrum/widget/rental_package_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeLoadData()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Electrum Home')),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is HomeError) {
              return Center(
                child: Text(state.message, style: TextStyle(color: Colors.red)),
              );
            }

            if (state is HomeLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPromotionSection(state.promotions),
                      SizedBox(height: 20),
                      _buildRentalPackagesSection(state.rentalPackages),
                      SizedBox(height: 20),
                      _buildAvailableBikesSection(state.bikes),
                    ],
                  ),
                ),
              );
            }

            return Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }

  Widget _buildPromotionSection(List<dynamic> promotions) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Special Offers', style: AppTextStyles.title),
      SizedBox(height: 12),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int index = 0; index < promotions.length; index++)
              Builder(
                builder: (context) {
                  final promo = promotions[index];
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    margin: EdgeInsets.only(
                      right: index < promotions.length - 1 ? 12 : 0,
                    ),
                    child: PromotionCard(
                      label: promo.label,
                      labelColor: Color(
                        int.parse(promo.labelColor.replaceFirst('#', '0xFF')),
                      ),
                      chipColor: Color(
                        int.parse(promo.chipColor.replaceFirst('#', '0xFF')),
                      ),
                      title: promo.title,
                      description: promo.description,
                      buttonText: promo.buttonText,
                      discountText: promo.discountText,
                      priceText: promo.priceText,
                      onButtonPressed: () {},
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    ],
  );

  Widget _buildAvailableBikesSection(List<dynamic> bikes) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Available Bikes', style: AppTextStyles.title),
      SizedBox(height: 12),
      ...bikes.take(3).map((bike) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Builder(
            builder: (context) => CardBike(
              bike: bike,
              onTap: () {
                context.pushNamed(
                  'bike-detail',
                  pathParameters: {'bikeId': bike.id},
                );
              },
            ),
          ),
        );
      }),
    ],
  );

  Widget _buildRentalPackagesSection(List<dynamic> packages) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Rental Packages', style: AppTextStyles.title),
      SizedBox(height: 12),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int index = 0; index < packages.length; index++)
              Builder(
                builder: (context) {
                  final package = packages[index];
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    margin: EdgeInsets.only(
                      right: index < packages.length - 1 ? 12 : 0,
                    ),
                    child: RentalPackageCard(
                      title: package.title,
                      subtitle: package.subtitle,
                      price: package.price,
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    ],
  );
}
