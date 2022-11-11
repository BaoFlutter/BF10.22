import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// Tạo ra 1 Widget Stateless  : My App
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget dùng sẵn từ Flutter Material
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController birthYearController = TextEditingController();
  String userName = "Chưa xác định";
  int? age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tính tuổi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // nhập tên
              inputWidget(label: "Họ và tên",
                  hintTitle: "Nhập họ và tên", controller: usernameController),

              // nhập năm sinh
              inputWidget(label: "Năm sinh",
                  hintTitle: "Nhập năm sinh", controller: birthYearController),
              // button
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      userName = usernameController.text;
                      age = DateTime.now().year - int.parse(birthYearController.text);
                    });

                  },
                  child: Text("Tính tuổi")),

              // card
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Card(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Họ và tên: $userName"),
                          const SizedBox(width: 30,),
                          Text("Tuổi: ${age??0}"),

                        ],
                      )
                  ),
                ),
              )

            ],
          ),
        ),
      )



    );
  }

  Widget inputWidget({ required String label, required String hintTitle,
    required TextEditingController controller}){
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


