import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String butonText;
  final Color butonColor;
  final Color textColor;
  final double radius;
  final double height;
  final Widget? butonIcon;
  final VoidCallback onPressed;

  const LoginButton(
      {Key? key,
      required this.butonText,
      this.butonColor: Colors.purple,
      this.textColor: Colors.white,
      this.radius: 16,
      this.height: 40,
      this.butonIcon,
      required this.onPressed})
      : assert(butonText != null, onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: butonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (butonIcon != null) ...[
                butonIcon!,
                Text(
                  butonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
                Opacity(opacity: 0, child: butonIcon)
              ],
              if (butonIcon == null) ...[
                Container(),
                Text(
                  butonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
                Container(),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
