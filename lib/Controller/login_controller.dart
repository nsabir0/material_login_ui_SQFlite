import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';
import 'package:material_login_ui/View/home_page.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  late userData_Model user;

  loginFunc() async {
    MyDatabase myDatabase = MyDatabase();
    String name = '', email = '', password = '';

    List<userData_Model> info = await myDatabase.queryData();
    for (int i = 0; i < info.length; i++) {
      if (info[i].email == emailController.text.toString()) {
        name = info[i].name;
        email = info[i].email;
        password = info[i].password;

        user=info[i];
        print(user.id);
      }
    }
    if (email == '') {
      Get.snackbar('User not Found !', 'Please Signup First');
    } else {
      if (email == emailController.text.toString() &&
          password == passController.text.toString()) {
        Get.snackbar('Hello $name', 'Logged In successfully ');
        passController.clear();
        emailController.clear();
        Get.to(HomePage(), arguments: [user]);
      } else if (email == emailController.text.toString() &&
          password != passController.text.toString()) {
        Get.snackbar('Try Again', 'Wrong password');
      }
    }
  }
}
