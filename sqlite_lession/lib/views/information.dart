import 'package:flutter/material.dart';
import 'package:state_lession/resources/strings.dart';
import 'package:state_lession/resources/widgets/information_card.dart';
class Information extends StatelessWidget {
  final double diemTrungBinh;
  final String hocLuc;
  const Information({Key? key, required this.diemTrungBinh, required this.hocLuc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(THONG_TIN),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:   InformationCard(
            label1: DIEM_TRUNG_BINH,
            content1: "$diemTrungBinh",
            label2: HOC_LUC,
            content2: hocLuc)
      ),
    );
  }
}
