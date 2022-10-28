import 'package:dart_core/dart_core.dart' as dart_core;

int tong = 10; // biến toàn cục 
void main(List<String> arguments) {
  // Biến và hàm
  int number  = 10;
  String userName = "Báo Flutter";
  bool isLogined = true; 

  //2 . Sử dụng hàm
  printLog("Hello Dart");

  // Hằng 
  const double PI = 3.146567 ;
  number = 20;
  final double piTemp = PI; 
  int sum = tinhTong(number, 5);
  print("Tổng của 2 số $number và 5 là: $sum");
  print("Tổng của 2 số $number và 5 là: " + sum.toString());

  // Static : int , string, boolean , double, List, Map, ( User , Information )

  // Dynamic : var, dynamic 

  var secondNumber = 6; // kiểu int 
  dynamic thirdNumber = 8.9 ; // kiểu double 
  // Khác nhau var, dynamic 
  secondNumber = 10; // secondNumber = "Sáu" ; // Error 
  thirdNumber = true; // boolean 
  // var : không dùng làm kiểu dữ liệu đầu ra của hàm, dynamic thì ngược lại 
  // nếu kiểu dữ liệu là dynamic 

  int temp ; // temp không đc gán là null và temp  không thể sử dụng đươc
  temp = 5;
  int hieu = temp -3 ; 

  int? temp2; // đặt ? sau kiểu dữ liệu để biến có giá trị null 

  // int tich = temp2! * 5; // Đặt "!" vào sau biến null để có thể sử dụng trong phương thức 

 //  tich = temp2??0 * 10;  
 checkSoChan(number: 19);
 checkSoLe(number: 21);

 bool test = ( 3>4 ) && (5<6); // false &&  true : // false 

 checkChanLe(number: 15);

 // List : Collection Là tập hơp của các phần tử có kiểu dữ liệu 
 List<int> numberList =         [2, 6, 8, 9, 10];
 // chỉ số - index của phần tử :  0, 1, 2, 3,  4
 //     Độ dai     length  = 5; 
 print ("Phần tử thứ 3 của List có độ dài ${numberList.length} là ${numberList[3]}" );
 List<dynamic> secondList = [ 4, 9.5, true, "hai"];
 int evenNumber = showSumEvenNumber(numberList: numberList);
 print ("Tổng các số chẵn là : $evenNumber ");

 // Map :  ( key : value ). ( key : value ).  ( key : value ). 

 Map<String, dynamic > map = {
  "name" : "Bao Flutter",
  "birth_year" : 1991
 };

 print (map["name"]);

 Map secondMap = {
  1: "Dart",
  "hai": 2005,
  3: true,

 };



}

// 
int showSumEvenNumber( { required List<int> numberList }){
  
  int sum = 0 ; 
  /*
  // for ... in 
  for (int number in numberList)
  {
    if(number%2 == 0) sum += number; // sum = sum + number
  }
  */

  /*
  // index 
  for(int i = 0 ; i< numberList.length ; i++) // i = i+ 1;
  {
    if(numberList[i] % 2 == 0 ) sum += numberList[i];
  }
  */
  /*
  int i = 0;
  print("test");
  while(i < numberList.length ){
    if(numberList[i] % 2 == 0 ) sum += numberList[i];
    i++;
   // if(  numberList[index] == 9 ) break;
  }
  */

  int i = 0;

 do  {
    if(numberList[i] % 2 == 0 ) sum += numberList[i];
   // if(  numberList[index] == 9 ) break;
   i++;
  } while(i < numberList.length ); 


  return sum;

}

// 1. Tạo hàm
void printLog(String str)
{
  print("*** $str ****");
  return;
}

 tinhTong( a,  b)
{
  int test = 2; 
  test += 5;  // test = test + 5 = 7; 
  return a + b; 
}

 tinhTong2( a,  b) => a + b; 

 void checkSoChan({int? number})
 {
  // if .... else ... 
  if(number! % 2 == 0 ) print("Số $number là số chẵn");
  else print("Số $number là số lẻ");
 }

 void checkSoLe({required int number})
 {
  // if .... else ... 
  if(number % 2 == 1 ) print("Số $number là số lẻ");
  else print("Số $number là số chẵn");
 }

 //  x +=2; <=> x = x+2; 
 // x++; <=> x = x +1 ;
 String soSanh({ required int firstNumber , required int secondNumber})
 {
if(firstNumber != secondNumber) return "Hai số $firstNumber và $secondNumber không bằng nhau";
if(firstNumber >  secondNumber) return " số $firstNumber lớn hơn $secondNumber ";
else return "Kết quả khác";
  
 }

 // bool a || b : Chỉ nhận giá trị là false khi cả a và b là 0; các th còn lại kq là : 1 
 // a && b : chỉ nhận giá trị là true khi cả 2 đều là true 

 void checkChanLe({ required int number}) { // number : cục bộ 

 switch(number%2){

  case 0:
  print("Số $number là số chẵn");
  break; // gặp từ khoá này thì thoát khỏi vòng lặp 

  case 1: 
  print("Số $number là số lẻ");
  break;

  default:
  print("số $number không hợp lệ");
  break;

 }


 }
