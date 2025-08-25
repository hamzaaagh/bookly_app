import 'package:bookly/core/utils/Styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundcolor,
    required this.text,
    required this.textcolor,
    this.borderRadius,
    this.onpressed,
  });
  final Color backgroundcolor;
  final String text;
  final Color textcolor;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundcolor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
      ),
      onPressed: onpressed,

      child: Text(
        text,
        style: Styles.text16.copyWith(
          color: textcolor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
