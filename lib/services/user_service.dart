import 'package:get/get.dart';
import 'package:todo/models/User.dart';

class UserService extends GetxController{
  final RxList<User> users = <User>[].obs;
  final RxList<User> usersFiltered = <User>[].obs;
  RxBool isLogged = false.obs;

  void add(User user){
    users.add(user);
    usersFiltered.add(user);
  }

  void edit(User user){
    final index = users.indexWhere((e)=>e.id == user.id);
    final indexFiltered = usersFiltered.indexWhere((e)=>e.id == user.id);

    users[index] = user;
    usersFiltered[indexFiltered] = user;
  }

  void delete(int id){
    users.removeWhere((e)=>e.id == id);
    usersFiltered.removeWhere((e)=>e.id == id);
  }

  void login(String mail, String pwd){
    users.map((e){
      if(e.mail == mail && e.password == pwd){
        isLogged.value = true;
      }
    });
  }

  void logout(){
    isLogged.value = false;
  }
}