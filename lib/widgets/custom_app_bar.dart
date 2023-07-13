import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = AppColors.background,
  }) : super(key: key);

  final String title;
  final Color backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      excludeHeaderSemantics: true,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpeg', // Chemin de l'image du logo
              width: 50.0,
              height: 50.0,
              // ajustez la largeur et la hauteur selon vos besoins
            ),
            SizedBox(width: 8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
