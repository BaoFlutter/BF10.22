import 'package:flutter/material.dart';
class Description extends StatelessWidget {
  final String text;
  const Description({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: Text(
        text,
        softWrap: true,
      ),
    );
  }
}
