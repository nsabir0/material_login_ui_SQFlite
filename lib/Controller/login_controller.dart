import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';
import 'package:material_login_ui/View/home_page.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  loginFunc() async {
    MyDatabase myDatabase = MyDatabase();

    userData_Model user = await myDatabase.getUserDataByEmail(emailController.text.toString());


    if (user.email == '') {

      Get.snackbar('User not Found !', 'Please Signup First');
    } else {
      if (user.email == emailController.text.toString() &&
          user.password == passController.text.toString()) {
        Get.snackbar('Hello ${user.name}', 'Logged In successfully ');
        passController.clear();
        emailController.clear();
        Get.to(() => const HomePage(), arguments: [user]);
      } else if (user.email == emailController.text.toString() &&
          user.password != passController.text.toString()) {
        Get.snackbar('Try Again', 'Wrong password');
      }
    }


    print('');
    print('');
    print('');
    print(user.name);
    print('');
    print('');
    print('');
  }
}
