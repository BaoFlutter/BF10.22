import 'room.dart';

class Guest {
String? userName;
int? birthYear; 
String? cMTND; 
int? rentNumber; 
Room? rentRoom; 

Guest({this.userName, this.birthYear, this.cMTND});

int takeCost(){
return rentNumber! * rentRoom!.price!;
}


}