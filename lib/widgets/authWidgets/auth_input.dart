import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthInput extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon; // Change this to Widget?
  final Widget? suffixIcon; // Change this to Widget?
  final TextEditingController? controller;
  final bool isObscure;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  const AuthInput({
    Key? key,
    required this.hintText, // Custom hint text
    this.prefixIcon,
    this.suffixIcon, // Icon is now optional (nullable)
    this.controller, // Text editing controller for input handling
    this.isObscure = false, // For passwords or secure text
    this.keyboardType = TextInputType.text, // Keyboard type (email, text, etc.)
    this.onChanged, // Initialize the callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          cursorColor: Colors.white,
          obscureText: isObscure,
          keyboardType: keyboardType, // Defines the keyboard type
          onChanged: onChanged,
          style: TextStyle(
            color: Colors.white, // Text color is white
            fontSize: 18.sp,
            fontFamily: "ProximaNovaAlt",
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white,
              fontFamily: "ProximaNovaAlt",
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white38,
                width: 2, // White border when not focused
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white38,
                width: 2, // White border when focused
              ),
            ),

            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: prefixIcon, // Use the passed prefixIcon widget
                  )
                : null, // If icon is null, don't display the prefixIcon
            prefixIconConstraints: const BoxConstraints(
              minWidth: 10, // Adjust space between icon and text
              minHeight: 10,
            ),
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: suffixIcon, // Use the passed suffixIcon widget
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 10, // Adjust space between icon and text
              minHeight: 10,
            ),
          ),
        )
      ],
    );
  }
}
