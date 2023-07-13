import 'package:flutter/material.dart';
import '../models/offer_model.dart';
import '../theme/colors.dart';

class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({
    Key? key,
    required this.offer,
    required this.onApply,
    required this.onViewDetails,
  }) : super(key: key);

  final Offer offer;
  final VoidCallback onApply;
  final VoidCallback onViewDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: onViewDetails,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/logo.jpeg', // Chemin de l'image dans les assets
                width: 120.0,
                height: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer.typeOffer?.name ?? '',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlack,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      offer.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14.0,
                          color: AppColors.textSecondary,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          'Publié le ${offer.dateStart.day}/${offer.dateStart.month}/${offer.dateStart.year}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14.0,
                          color: AppColors.textSecondary,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          'Date limite ${offer.dateEnd.day}/${offer.dateEnd.month}/${offer.dateEnd.year}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textWhite,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: onViewDetails,
                          icon: Icon(
                            Icons.arrow_right,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
