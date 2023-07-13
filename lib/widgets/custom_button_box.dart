import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomButtonBox extends StatelessWidget {
  const CustomButtonBox({
    Key? key,
    required this.title,
    required this.onPressed,
    required List<BoxShadow> boxShadow,
    required BorderRadius borderRadius,
    required Color color,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
