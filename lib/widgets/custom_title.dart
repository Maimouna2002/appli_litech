import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.title,
    this.route = '/404',
    this.extend = true,
    this.fontSize = 20.0,
    this.arg,
  }) : super(key: key);

  final String title;
  final String route;
  final bool extend;
  final double fontSize;
  final arg;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: secondary,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        (extend)
            ? GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   route,
                  //   arguments: arg,
                  // );
                },
                child: Text(
                  'voir plus',
                  style: TextStyle(
                      color: primary,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400),
                ),
              )
            : Container(),
      ],
    );
  }
}
