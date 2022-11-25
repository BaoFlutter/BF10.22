import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_lession/databases/mark_database.dart';
import 'package:state_lession/models/mark.dart';
import 'package:state_lession/resources/strings.dart';
import 'package:state_lession/resources/widgets/button_widget.dart';
import 'package:state_lession/resources/widgets/information_card.dart';
import 'package:state_lession/resources/widgets/input_widget.dart';
import 'package:state_lession/views/information.dart';
import 'package:state_lession/views/local_storage_information.dart';

import 'sqlite_information.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
   // 1. Tạo ra state : state được tạo ra , đồng thời buildcontext được tạo ra và gắn vs state
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // 2 . mounted = true // đại diện cho sự xuất hiện của state

  TextEditingController? toanController, vanController, anhController ;
  double diemTrungBinh = 0;
  String hocLuc = "Chưa xác định";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // 3: Khởi động state
  MarkDatabase markDb = MarkDatabase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toanController = TextEditingController();
    vanController = TextEditingController();
    anhController = TextEditingController();

    // Chưa dùng được context
  }

  // 4. khi có dependicies thay đổi

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // Được dùng biến context
  }

  // 5. Hàm build : hỗ trợ build các widget để hiển thị lên giao diện

  @override
  Widget build(BuildContext context) {

    if(mounted) print("State đã tồn tại ");
    else print("State chưa tồn tại");

    return Scaffold(
      appBar: AppBar(
        title: Text(DANH_GIA_HOC_SINH),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
          child: Column(
            children: [
              // Điểm toán
              InputWwidget(label: DIEM_TOAN, hintTitle: NHAP_DIEM_TOAN, controller: toanController!),

              // Điểm Văn
              InputWwidget(label: DIEM_VAN, hintTitle: NHAP_DIEM_VAN, controller: vanController!),

              // Điểm Anh
              InputWwidget(label: DIEM_ANH, hintTitle: NHAP_DIEM_ANH, controller: anhController!),

              // Đánh giá Button

              const SizedBox(
                height: 30,
              ),

              ButtonWidget(
                iconData: Icons.add_task,
                buttonTitle: DANH_GIA,
                onPressed: (){
                // 6. setState
                  setState(() {
                    diemTrungBinh = (double.parse(toanController!.text) + double.parse(vanController!.text) +double.parse(anhController!.text))/3;
                    hocLuc = danhGiaHocLuc(diemTB: diemTrungBinh);
                  });
                  // lưu giá trị vào trong LocalStorage
                  saveInformationIntoLocalStorage(diemTrungBinh: diemTrungBinh, hocLuc: hocLuc);
                  Mark mark = Mark(id: null, toan: double.parse(toanController!.text), van: double.parse(vanController!.text), anh: double.parse(anhController!.text), diem_trung_binh: diemTrungBinh, hoc_luc: hocLuc);
                  saveIntoSQlite(mark: mark);

                },
              ),
              // Information Card
              InformationCard(
                  label1: DIEM_TRUNG_BINH,
                  content1: diemTrungBinh==0 ? "Chưa xác định" : "$diemTrungBinh",
                  label2: HOC_LUC,
                  content2: hocLuc),
              TextButton(
                  onPressed: (){
                    var route = MaterialPageRoute(builder: (context) => Information(diemTrungBinh: diemTrungBinh, hocLuc: hocLuc));
                    Navigator.push(context, route);
                  },
                  child: Text("Show Information")),
              TextButton(
                  onPressed: (){
                    var route = MaterialPageRoute(builder: (context) =>SqliteInformation());
                    Navigator.push(context, route);
                  },
                  child: Text("Show Information In SQlite")),
              TextButton(
                  onPressed: (){
                    var route = MaterialPageRoute(builder: (context) => LocalStorageInformation());
                    Navigator.push(context, route);
                  },
                  child: Text("Show Information In Local Storage")),


            ],
          ),
        ),
      )
    );
  }

  saveInformationIntoLocalStorage({ required double diemTrungBinh, required String hocLuc }) async {
    final SharedPreferences prefs = await _prefs ;
    await prefs.setDouble("diem_trung_binh", diemTrungBinh);
    await prefs.setString("hoc_luc", hocLuc);
  }

  saveIntoSQlite({required Mark mark} ) async {
   await markDb.addMark(mark);

  }

  // 7. did updateWidget
  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  String danhGiaHocLuc({ required double diemTB}){
    if(diemTB < 5 ) return "Học lực chưa đạt";
    if(diemTB < 8.5) return "Học lực đạt";
    if(diemTB > 8.5 ) return "Xuất sắc";
    return "Không xác định do điểm không hợp lệ";
  }

  // 8. Ngưng state
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  // 9. Huỷ State đi

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    toanController!.dispose();
    vanController!.dispose();
    anhController!.dispose();
  }

  // 10 . mounted = false ;




}
