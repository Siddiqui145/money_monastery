import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.textColor
    });

  final VoidCallback onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsets? padding;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      //height: 50,
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Color.fromRGBO(204, 196, 196, 1),
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0)
          )
        ),
        child: Text(title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor
        )),
      ),
    );
  }
}