import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function onPress;
  final Color accentColor;
  final IconData icon;
  final String text;

  LoginButton(
      {@required this.onPress,
      @required this.icon,
      this.text = "",
      this.accentColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: accentColor, width: 1.5),
            boxShadow: [
              BoxShadow(
                blurRadius: 1.5,
                spreadRadius: 0.1,
                color: this.accentColor,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.icon,
              color: this.accentColor,
              size: 22,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              this.text,
              style: TextStyle(
                  color: this.accentColor,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
