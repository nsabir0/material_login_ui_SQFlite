import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';
import 'package:material_login_ui/View/home_page.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

   userData_Model user = userData_Model(name: '', email: '', password: '');

  loginFunc() async {
    MyDatabase myDatabase = MyDatabase();

    List<userData_Model> info = await myDatabase.getLoginUser();
    for (int i = 0; i < info.length; i++) {
      if (info[i].email == emailController.text.toString()) {
        user=info[i];
      }
    }
    if (user.email == '') {
      Get.snackbar('User not Found !', 'Please Signup First');
    } else {
      if (user.email == emailController.text.toString() &&
          user.password == passController.text.toString()) {
        Get.snackbar('Hello ${user.name}', 'Logged In successfully ');
        passController.clear();
        emailController.clear();
        Get.to(const HomePage(), arguments: [user]);
      } else if (user.email == emailController.text.toString() &&
          user.password != passController.text.toString()) {
        Get.snackbar('Try Again', 'Wrong password');
      }
    }
  }
}
