class Employee {

  // Thuộc tính ( đặc điểm )  : biến 
   int? id; // public 
   String? userName;  // public 
   int? birthYear;  // public 
   String? adress;  // public 
    String nationality = "Việt Nam";  // public 
   // final int? number;  // khi có biến final là null thì phải khỏi tạo giá trị này trong hàm khởi tạo 
   int? _moneyTotal = 600000;  // private 
   // Hàm , biến Private : không thể sử dụng được ở bên ngoài class 

   // static  double PI = 4.5 ;


   // Phương thức (hành động, hành vi): hàm 
   // hàm khởi tạo 
   // 1. hàm măc đinh
    // Employee();
    Employee({ required  this.id, required this.userName, required  this.birthYear,  this.adress });

   void sayHi(){  // public 
    print("Chào mừng bạn");

   }

   int getAge(){  // public 
    int age = DateTime.now().year - this.birthYear!;
    return age;
   }

   void changeBirthYear( {  required int birthYear } ){  // public 
    this.birthYear = birthYear;

   }

   int _getMoney(){  // private 
    return this._moneyTotal!;
    
   }

   // hàm getter , setter 


   // getter 
   int getMoneyTotal(){
    return this._moneyTotal!;
   }

   int get getMoneyTotal1 => this._moneyTotal!;
   
   // setter 
   void setMoney({required int money}){
    this._moneyTotal  = money ;
    }





}