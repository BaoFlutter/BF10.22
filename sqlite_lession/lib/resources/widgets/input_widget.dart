import 'package:flutter/material.dart';
class InputWwidget extends StatelessWidget {
  final String label;
  final String hintTitle;
  final TextEditingController controller;
  const InputWwidget({Key? key, required this.label, required this.hintTitle, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label,
            hintText: hintTitle
        ),
        controller: controller,
      ),
    );
  }
}
