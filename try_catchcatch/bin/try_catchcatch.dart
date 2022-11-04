

void main(List<String> arguments) {
 
var number = "Flutter";

try {
  int result =  int.parse(number);
}
on FormatException{
  print("Xin vui lòng nhập lại bằng số");
}
catch(e){ // 1. không làm chương trình dừng đột ngột / biết được loai exception 
  print(e.toString());
}

finally {
  print("Khối lệnh bắt buộc phải được chạy");
}

print("Chương trình kết thúc");

 try {
  danhGiaTuoi(age: -10);
 }
 catch(e)
 {
  print(e.toString());
 }



}

void danhGiaTuoi({required int age})
{
  if(age <= 0 ) throw Exception(" AgeException - Tuổi không được âm ");
  else if(age<50) print("Bạn vẫn trẻ");
  else print("Bạn đã có tuổi");
}
