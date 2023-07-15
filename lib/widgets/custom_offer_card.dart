import 'package:flutter/material.dart';
import 'package:stageapp/models/offer_model.dart';
import 'package:stageapp/theme/colors.dart';

class CustomOfferCard extends StatelessWidget {
  final Offer offer;
  final VoidCallback onApply;
  final VoidCallback onViewDetails;

  const CustomOfferCard({
    required this.offer,
    required this.onApply,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              offer.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              offer.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.0,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Places disponibles : ${offer.availablePlaces}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: AppColors.textSecondary,
                  ),
                ),
                ElevatedButton(
                  onPressed: onApply,
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: Text(
                    'Postuler',
                    style: TextStyle(
                      color: AppColors.textWhite,
                    ),
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
