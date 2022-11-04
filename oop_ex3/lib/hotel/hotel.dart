import 'room.dart';

import 'guest.dart';

class Hotel{

  List<Room>? roomList;
  List<Guest>? guestList; 

  void addGuest({required  Guest guest}){
    guestList!.add(guest);

  }

  void deleteGuest({required String cMTND})
  {
    for(Guest guest in this.guestList!)
    {
      if(guest.cMTND == cMTND){
        guestList!.remove(guest);
      }
    }


  }








}