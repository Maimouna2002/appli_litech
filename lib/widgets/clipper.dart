import 'package:flutter/material.dart';

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final controlPoint1 = Offset(size.width / 4, size.height);
    final controlPoint2 = Offset(size.width - size.width / 4, size.height);
    final endPoint = Offset(size.width, size.height - 20);

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
      controlPoint1.dx,
      controlPoint1.dy,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
