import 'package:flutter/material.dart';

class CustomOutlineButton extends MaterialButton {
  final double height;
  final double width;
  final double borderRadius;
  final String text;
  final VoidCallback onPressed;
  final Color color;

  CustomOutlineButton({
    this.height,
    this.width,
    this.borderRadius = 30.0,
    this.text,
    this.color,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.black, width: 2.0),
        child: Text(text, style: TextStyle(fontSize: 20, color: color)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
