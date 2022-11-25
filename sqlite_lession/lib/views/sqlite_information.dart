import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_lession/resources/strings.dart';
import 'package:state_lession/resources/widgets/information_card.dart';
import 'package:state_lession/views/home_screen.dart';

import '../databases/mark_database.dart';
import '../models/mark.dart';

class SqliteInformation extends StatefulWidget {
  const SqliteInformation({Key? key}) : super(key: key);

  @override
  State<SqliteInformation> createState() => _SqliteInformationState();
}

class _SqliteInformationState extends State<SqliteInformation> {

  Future<List<Mark>>? futureMarkList ;
  MarkDatabase markDb = MarkDatabase();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureMarkList = markDb.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(THONG_TIN),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.backspace_outlined),
          onPressed: (){
          Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          /*
          child:   InformationCard(
              label1: DIEM_TRUNG_BINH,
              content1: "$diemTrungBinh",
              label2: HOC_LUC,
              content2: hocLuc)

           */
        child: FutureBuilder<List<Mark>>(
            future: futureMarkList,
            builder: (context, snapshot){
              // dữ liệu load lỗi
              if(snapshot.hasError) return Center(
                child: Text("Load dữ liệu lỗi")
              );
              if(!snapshot.hasData) return Center(
                child: CircularProgressIndicator(),
              );
              List<Mark> markList = snapshot.data!;
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: markList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Mark mark = markList[index];
                    return Container(
                      height: 50,
                      child: Row(
                        children: [
                          Text("Toán: ${mark.toan}"),
                          const SizedBox(width:2),
                          Text("Văn: ${mark.van}"),
                          const SizedBox(width:2),
                          Text("Anh: ${mark.anh}"),
                          const SizedBox(width:2),
                          Text("TB: ${mark.diem_trung_binh!.toStringAsFixed(2)}"),
                          const SizedBox(width:2),
                          Text("HL: ${mark.hoc_luc}"),


                        ],
                      )
                    );
                  }
              );
            }
        ),

      ),
    );
  }

  loadDataSQlite(){
    futureMarkList = markDb.fetchAll();
  }

}

