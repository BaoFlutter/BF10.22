import 'package:flutter/material.dart';
class InputField extends StatelessWidget {

  final String labelText;
  final TextEditingController controller;
  const InputField({Key? key, required this.labelText, required this.controller } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 0.5, color: Theme.of(context).iconTheme.color!)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 0.5, color: Theme.of(context).iconTheme.color!)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0.5),),
          labelText: labelText,
          labelStyle: TextStyle(
              fontSize: 14,
              color: Theme.of(context).iconTheme.color,
              fontWeight: FontWeight.w600),
          // hintText: email,
          hintStyle: TextStyle(
              color: Theme.of(context).iconTheme.color,
              fontSize: 15,
              fontWeight: FontWeight.normal),
        ),
        cursorColor: Theme.of(context).iconTheme.color,
        controller: controller,
      ),
    );
  }
}
