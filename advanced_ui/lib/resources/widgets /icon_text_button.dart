import 'package:flutter/material.dart';
class IconTextButton extends StatelessWidget {
  final onPressed;
  final IconData iconData;
  final String text;
  final Color color ;


  const IconTextButton({Key? key, required this.onPressed, required this.iconData, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Column(
          children: [
            Icon(iconData, color: color,),
            const SizedBox(height: 5,),
            Text(text.toUpperCase(), style: TextStyle(color: color, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
