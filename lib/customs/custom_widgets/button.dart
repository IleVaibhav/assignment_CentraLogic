import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final onTap;
  final String text;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonRadius;
  final Color bgColor;
  final Color textColor;
  const CustomTextButton({
    super.key, 
    required this.onTap, 
    required this.text, 
    required this.buttonHeight, 
    required this.buttonWidth, 
    required this.buttonRadius, 
    required this.bgColor, 
    required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: buttonHeight,
        width: buttonWidth == 0 ? MediaQuery.of(context).size.width : buttonWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(buttonRadius)
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w700
          ),
          textAlign: TextAlign.center
        ),
      ),
    );
  }
}