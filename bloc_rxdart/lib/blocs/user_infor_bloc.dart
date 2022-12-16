import 'package:rxdart/rxdart.dart';

import '../data_sources/repository.dart';

class UserInforBloc {
  final _repository = Repository();

  final encodedUserInforSubject = PublishSubject();

  // sink ( put ) Data into Bloc
  putDataIntoBloc() async {
    var encodedUserInfor = await _repository.fetchUserInfor();
    encodedUserInforSubject.sink.add(encodedUserInfor);
  }

  // take a stream to View
  Stream get encodedUserInforStream => encodedUserInforSubject.stream;

  dispose(){
    encodedUserInforSubject.close;
  }




}