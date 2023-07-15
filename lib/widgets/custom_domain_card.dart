import 'package:flutter/material.dart';
import 'package:stageapp/models/offer_model.dart';

import '../theme/colors.dart';

class CustomDomainCard extends StatelessWidget {
  final Domain domain;
  final String title;
  final VoidCallback onTap;

  const CustomDomainCard({
    required this.domain,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.primary,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: AppColors.textWhite,
            ),
          ),
        ),
      ),
    );
  }
}
