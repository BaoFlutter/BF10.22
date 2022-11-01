import 'package:oop_dartdart/hinh/hinh_vuong.dart';
import 'package:oop_dartdart/oop_dartdart.dart' as oop_dartdart;
import 'package:oop_dartdart/xe/xe_tai.dart';

import 'employee.dart';

void main(List<String> arguments) {

  Employee viet = Employee(id: 1, userName: "Nguyen Minh Viet", birthYear:1998); 
  Employee nam = Employee(id: 2, userName: "Le Huu Nam", birthYear:1988);
  Employee hoa = Employee(id: 3, userName: "Nguyen Thi Hoa", birthYear:1992);
  Employee binh = Employee(id: 4, userName: "Nguyen Hoa Binh", birthYear:1978);
  // int number = 10; 

  //double number = Employee.PI ;

  print( " ${hoa.userName} có tuổi là: ${hoa.getAge()}");
  binh.setMoney(money: 56000000000);
  print(binh.getMoneyTotal().toString());

  

  List<Employee> employeeList  = [];
  employeeList.add(viet);
  employeeList.add(nam);
  employeeList.add(hoa);
  employeeList.add(binh);


  Employee oldestEmployee = findOldestEmployee(employeeList: employeeList);
  print("Người già nhất là Ông/Bà: ${oldestEmployee.userName} có tuổi là: ${oldestEmployee.getAge()} ");
 

 // Kế thừa 
 
 XeTai  xeHuynDai = XeTai(brand: "HuynDai98", productionYear: 1999);
 xeHuynDai.chuyenCho();
 print("Tuổi của xe là: ${xeHuynDai.getAge()}");

 // Hinh 
 HinhVuong hinh1 = HinhVuong(canh: 4.5);
 hinh1.tinhChuVi();

}

// tạo hàm 

Employee findOldestEmployee({ required List<Employee> employeeList }){
  Employee? oldestEmployee;
  int maxAge = 0; 

  for (Employee person in employeeList )
  {
    int personAge = person.getAge();
    if(personAge >= maxAge ) {
     maxAge = personAge;
     oldestEmployee = person;
    }
  }

  return oldestEmployee!;

}


/// List list = [hoa , phong , lan ];
///               30,   29,     45 
/// 
/// max = 0 ;   max = 30 ; oldest  = hoa 
/// max = 30 ; oldest = hoa 
/// max = 30 ; max = 45 ; olset = lan 
