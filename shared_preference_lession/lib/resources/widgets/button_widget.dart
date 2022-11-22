import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {
  final onPressed;
  final IconData iconData;
  final String buttonTitle;
  const ButtonWidget({Key? key, required this.onPressed, required this.iconData, required this.buttonTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(15)
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(iconData), // Icons.back
            Text(buttonTitle)
          ],
        )
      ),
    );
  }
}
