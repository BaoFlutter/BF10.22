import 'package:flutter/material.dart';
class InformationCard extends StatelessWidget {
  final String label1;
  final String content1;
  final String label2;
  final String content2;

  const InformationCard({Key? key, required this.label1, required this.content1, required this.label2, required this.content2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Card(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$label1 : $content1"),
                const SizedBox(width: 30,),
                Text("$label2 : $content2"),

              ],
            )
        ),
      ),
    );
  }
}
