

void main(List<String> arguments) {
  
int sum = getSum(number: 1, startNumber: 1, endNumber: 20);
print ("Tổng các số tạo bởi các tích là :  $sum");

}

// tạo hàm 

int getSum({required int number, required int startNumber, required int endNumber}){
  int sum = 0; 

  for(int i = startNumber ; i<= endNumber ; i++)
  {
   sum = sum + number * i; // sum += number*i;
  }
  return sum ;

}