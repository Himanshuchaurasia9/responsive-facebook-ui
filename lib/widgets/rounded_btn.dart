import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class RoundedBTN extends StatelessWidget {
  RoundedBTN({Key key, @required this.width, @required this.text, @required this.onPressed}) : super(key: key);

  double width;
  String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: Palette.facebookBlue,
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
