import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_lession/resources/strings.dart';
import 'package:state_lession/resources/widgets/information_card.dart';
import 'package:state_lession/views/home_screen.dart';

class LocalStorageInformation extends StatefulWidget {
  const LocalStorageInformation({Key? key}) : super(key: key);

  @override
  State<LocalStorageInformation> createState() => _LocalStorageInformationState();
}

class _LocalStorageInformationState extends State<LocalStorageInformation> {
  Future<Map<String, dynamic>>? futureInformation ;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureInformation = _prefs.then((SharedPreferences pref) async {
      double? diemTB = await pref.getDouble("diem_trung_binh");
      String? hocLuc = await pref.getString("hoc_luc");
      return {
        "diem_trung_binh": diemTB,
        "hoc_luc": hocLuc
      };

    });
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
        child: FutureBuilder<Map<String, dynamic>>(
            future: futureInformation,
            builder: (context, snapshot){
              // dữ liệu load lỗi
              if(snapshot.hasError) return Center(
                child: Text("Load dữ liệu lỗi")
              );
              if(!snapshot.hasData) return Center(
                child: CircularProgressIndicator(),
              );
              Map<String, dynamic> futureInformation = snapshot.data!;
              double diemTrungBinh = futureInformation['diem_trung_binh'];
              String hocLuc = futureInformation['hoc_luc'];
              return InformationCard(
                  label1: DIEM_TRUNG_BINH,
                  content1: "$diemTrungBinh",
                  label2: HOC_LUC,
                  content2: hocLuc);
            }
        ),

      ),
    );
  }
}

