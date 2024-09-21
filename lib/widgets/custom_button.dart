import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressedButton;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  const CustomButton(
      {Key? key,
      this.color,
      this.height,
      required this.onPressedButton,
      required this.text,
      this.textStyle,
      this.buttonStyle,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressedButton,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                )),
        child: Text(
          text,
          style: textStyle, // Default text style if not provided
        ),
      ),
    );
  }
}
