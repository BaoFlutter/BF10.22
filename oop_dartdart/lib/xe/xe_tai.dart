import 'package:oop_dartdart/xe/xe.dart';

class XeTai  extends Xe{
  // dùng tất cả public : biến , hàm

  XeTai({required String brand , required int productionYear }): super(brand: brand, birthYear: productionYear );

  // Khi class có hàm khoi tao thì con ke thua nen khơi toạ cho cha 

 @override  // ghi đè 
  void chuyenCho(){
    // super : đại diện cho class cha 
    // super.chuyenCho();
    print("Xe chuyên chơ vật liệu xây dựng");

  }

  int getAge(){
    return DateTime.now().year - super.birthYear!;
  }


  


  
}