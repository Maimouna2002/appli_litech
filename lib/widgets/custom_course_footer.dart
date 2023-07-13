import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/padding.dart';
import 'custom_button_box.dart';

class CustomCourseFooter extends StatelessWidget {
  const CustomCourseFooter({
    Key? key,
    this.coursePrice = '',
    this.enrolled = false,
  }) : super(key: key);

  final String coursePrice;
  final bool enrolled;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 100.0,
      padding: EdgeInsets.only(
        left: appPadding,
        right: appPadding,
        top: appPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (enrolled)
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: CustomButtonBox(
                  title: 'Continue Class',
                  onPressed: () {},
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      spreadRadius: 0.0,
                      blurRadius: 6.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(17.5),
                  color: AppColors.primary.withOpacity(0.7),
                ),
              ),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Course Price',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      coursePrice,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                CustomButtonBox(
                  title: 'Enroll Now',
                  onPressed: () {},
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      spreadRadius: 0.0,
                      blurRadius: 6.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(17.5),
                  color: AppColors.primary.withOpacity(0.7),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
