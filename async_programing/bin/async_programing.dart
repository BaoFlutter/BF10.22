

void main(List<String> arguments) async {

 Future<int> numberFuture =   makeLateNumber();
 // int number = await  numberFuture;

numberFuture.then((number) {
 print(number.toString());
});


 // Future : 
 // Thuần : await numberFuture

Stream<int> numberStream = makeNumberStream();
readStream(numberStream: numberStream);

 print("Chương trình kế thúc");


}


makeLateNumber(){
  return Future.delayed(Duration(seconds: 2), (){ return 9;});
}
// Stream : 1 ống có rất nhiều dữ liệu bất đồng bộ chảy trong 
int numberUp(int value)=> value + 1; 

// Tạo ra Stream như thế nào 
// 1. 
Stream<int> makeNumberStream (){
  return Stream<int>.periodic(Duration(seconds: 1), numberUp );
}

// 2. 
Stream<int> makeSecondStream({required int maxNumber}) async *{
  for(int numb = 1; numb<= maxNumber ; numb++)  
  {
    yield numb;
  }

}


// Lấy dữ liệu từ Stream 
// 1.
void readStream({required Stream<int> numberStream}){
  numberStream.listen((number) { 
    print(number);
  });

}

// 2
void readStream2({required Stream<int> numberStream}) async {
  await for (int number in numberStream){
    print(number);

  }
}
