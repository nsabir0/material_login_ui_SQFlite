import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';
import 'package:material_login_ui/View/login_page.dart';

class SignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cfpassController = TextEditingController();
  MyDatabase myDatabase = MyDatabase();

  signupFunc() async {
    userData_Model saveData = userData_Model(
      name: nameController.text.toString(),
      email: emailController.text.toString(),
      password: passController.text.toString(),
    );

    userData_Model model = await myDatabase.insert(saveData);

    if (model.id != null && model.id != 0) {
      Get.snackbar('Hello ${model.name}', 'Registration Successful');
      nameController.clear();
      passController.clear();
      emailController.clear();
      cfpassController.clear();

      Get.offAll(LoginPage());
    } else {
      Get.snackbar('Registration Unsuccessful', 'Data Didn\'t Saved !');
    }
  }
}
