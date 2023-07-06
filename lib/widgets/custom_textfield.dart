import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/padding.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    this.controller,
    this.readOnlyField = false,
    this.isPassword = false,
    this.iconSize = 24.0,
    this.maxLine = 1,
    this.height = 50.0,
    this.keyboardType,
    this.iconColor,
  }) : super(key: key);

  final IconData prefixIcon;
  final double iconSize;
  final String labelText;
  final TextEditingController? controller;
  final bool isPassword;
  final bool readOnlyField;
  final int maxLine;
  final double height;
  final TextInputType? keyboardType;
  final Color? iconColor;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: secondary.withOpacity(0.25), width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            alignment: Alignment.center,
            child: Icon(
              widget.prefixIcon,
              size: widget.iconSize,
              color: widget.iconColor,
            ),
          ),
          SizedBox(width: miniSpacer),
          Flexible(
            child: TextField(
              onTap: () {},
              keyboardType: widget.keyboardType,
              readOnly: widget.readOnlyField,
              obscureText: widget.isPassword,
              controller: widget.controller,
              maxLines: widget.maxLine,
              style: TextStyle(
                fontSize: 15.0,
                color: secondary,
                fontWeight: FontWeight.w500,
              ),
              cursorColor: secondary,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: widget.labelText,
                labelStyle: TextStyle(
                  color: secondary.withOpacity(0.5),
                  fontSize: 15.0,
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
