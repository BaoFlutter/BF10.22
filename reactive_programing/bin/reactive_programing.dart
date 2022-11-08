import 'package:rxdart/rxdart.dart';

void main(List<String> arguments) {

//demoBehaviourSubject();
//demoPublishSubject();
demoReplaySubject();

}
// Sẽ lấy tất cả dữ liệu thêm vào sau đợt lắng nghe và chỉ lấy 1 giá trị được thêm vào trước đó 
demoBehaviourSubject(){
  // Tạo 1 subject : tạo ra 1  Stream 
  BehaviorSubject<int> subject = BehaviorSubject<int>(); 
  subject.listen((value) { 
    print("Lấy dữ liệu lần 1: $value");
  });
  subject.add(100);  // đẩy dữ liệu trong stream
  subject.add(101);
  subject.listen((value) { 
    print("Lấy dữ liệu lần 2: $value");
  });
  subject.add(200);
  subject.add(201);

}

// Sẽ lấy tất cả dữ liệu trước và sau lắng nghe 
demoPublishSubject(){
  // Tạo 1 subject : tạo ra 1  Stream 
  PublishSubject<int> subject = PublishSubject<int>(); 
  subject.listen((value) { 
    print("Lấy dữ liệu lần 1: $value");
  });
  subject.add(100);  // đẩy dữ liệu trong stream
  subject.add(101);
  subject.listen((value) { 
    print("Lấy dữ liệu lần 2: $value");
  });
  subject.add(200);
  subject.add(201);

}


demoReplaySubject(){
  // Tạo 1 subject : tạo ra 1  Stream 
  ReplaySubject<int> subject = ReplaySubject<int>(); 
  subject.listen((value) { 
    print("Lấy dữ liệu lần 1: $value");
  });
  subject.add(100);  // đẩy dữ liệu trong stream
  subject.add(101);
  subject.listen((value) { 
    print("Lấy dữ liệu lần 2: $value");
  });
  subject.add(200);
  subject.add(201);

}