import 'package:flutter/material.dart';
import '../models/offer_model.dart';
import '../theme/colors.dart';

class CustomDomainesButton extends StatelessWidget {
  final Domain domain;
  final Function() onTap;

  const CustomDomainesButton({
    required this.domain,
    required this.onTap,
    required String title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 10.0,
            bottom: 10.0,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.7),
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.accentError.withOpacity(0.5),
                spreadRadius: 0.0,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Text(
            domain.name,
            style: TextStyle(
              color: AppColors.textWhite,
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
