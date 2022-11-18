import 'package:flutter/material.dart';
class ImageCover extends StatelessWidget {
  final String imagePath;
  const ImageCover({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath,
     width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2.5,
      fit: BoxFit.cover,
    );
  }
}
