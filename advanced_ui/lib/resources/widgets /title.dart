import 'package:flutter/material.dart';
class TitleWidget extends StatelessWidget {
  final String title;
  final String adress;
  final int rate;
  const TitleWidget({Key? key, required this.title, required this.adress, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Row(
        children: [
          // Khối title
          Expanded(
            flex: 5,
            child: Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  Text(adress, style: TextStyle(color: Colors.black45),),
                ],
              ),
            ),),
          // Rate
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.red,),
                  Text(rate.toString())
                ],
              ),
            ),)
        ],
      ),
    );
  }
}
