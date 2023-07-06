import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.showFilterButton = false,
    this.backgroundColor = background,
  }) : super(key: key);

  final String title;
  final bool showBackButton;
  final bool showFilterButton;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      excludeHeaderSemantics: true,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              if (showBackButton)
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: primary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (showFilterButton)
                IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: primary,
                  ),
                  onPressed: () {
                    // TODO: Implement filter logic
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
