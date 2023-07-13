import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomPlaceHolder extends StatelessWidget {
  const CustomPlaceHolder({
    Key? key,
    required this.title,
    this.isSwitch = false,
    required Null Function() onTap,
  }) : super(key: key);

  final String title;
  final bool isSwitch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.grey,
            ),
          ),
          if (isSwitch)
            Switch(
              value: false,
              onChanged: (bool value) {},
            )
          else
            Icon(
              Icons.arrow_forward_ios,
              size: 16.0,
              color: AppColors.grey,
            ),
        ],
      ),
    );
  }
}
