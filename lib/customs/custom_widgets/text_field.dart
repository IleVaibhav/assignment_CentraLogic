import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final bool isObsecure;
  final TextInputType keyboardType;
  final String title;

  const CustomTextFormField({
    super.key, 
    required this.controller, 
    required this.hint, 
    this.maxLines = 1,
    this.isObsecure = false,
    required this.keyboardType, 
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isObsecure,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, 
            vertical: 15.0
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.shade800,
              width: 1
            )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red.shade900,
              width: 1
            )
          )
        ),
        validator: (value) {
          if(value!.isEmpty) {
            return 'Please enter $hint';
          }
          return null;
        }
      )
    );
  }
}