import 'package:advanced_ui/resources/widgets%20/description.dart';
import 'package:advanced_ui/resources/widgets%20/icon_text_button.dart';
import 'package:advanced_ui/resources/widgets%20/image_cover.dart';
import 'package:advanced_ui/resources/widgets%20/title.dart';
import 'package:flutter/material.dart';

import '../resources/strings.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Khối 1: Image Cover
            ImageCover(imagePath: "assets/images/lake.jpeg"),

            // Khối 2: Title
            TitleWidget(title: "Oeschinen Lake Campground", adress: "Kandersteg, Switzerland", rate: 41),


            // Khối 3: Buttons
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  Expanded(
                    flex:1,
                      child: IconTextButton(
                          iconData: Icons.call,
                          text: call,
                          color: Colors.blue,
                        onPressed: (){
                            print("Calling..");
                        },)),
                  Expanded(
                      flex:1,
                      child: IconTextButton(
                        iconData: Icons.navigation,
                        text: route,
                        color: Colors.blue,
                        onPressed: (){
                          print("Routing..");
                        },)),
                  Expanded(
                      flex:1,
                      child: IconTextButton(
                        iconData: Icons.share,
                        text: share,
                        color: Colors.blue,
                        onPressed: (){
                          print("Sharing..");
                        },)),



                ],
              ),
            ),
            const SizedBox(height: 20,),


            // Khối 4 :  Description
            Description(text: "Here is the summer hiking map for the Oeschinensee area above Kandersteg. The 8-person gondola takes you from Kandersteg up the mountain, where you’ll find a restaurant with a view. The mountain coaster is directly behind the gondola station. To reach the lake, walk on the the dirt road, following signs to Oeschinensee. At the lake, you’ll find rocky beaches, picnic areas with fire pits, two restaurants/hotel and row boats to rent. You can swim in the lake but the water is very cold."),

          ],
        ),
      ),
    );
  }
}
