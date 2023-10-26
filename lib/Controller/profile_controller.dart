import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';
import 'package:material_login_ui/View/login_page.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  userData_Model user = Get.arguments[0];

  MyDatabase myDatabase = MyDatabase();

  saveFunc() async {

    if(nameController.text!=''){
      user.name=nameController.text;
    }
    if(emailController.text!=''){
      user.email=emailController.text;
    }
    if(passController.text!=''){
      user.password=passController.text;
    }

    var returnId = await myDatabase.updateUserData(user);


    if(nameController.text=='' && emailController.text=='' && passController.text==''){

    }else{
      if (returnId != null && returnId != 0) {
        Get.snackbar('Hello ${user.name}', 'Profile Updated successfully');
      } else {
        Get.snackbar('Error!!!', 'Data Didn\'t Saved');
      }
    }

    nameController.clear();
    emailController.clear();
    passController.clear();
  }

  deleteUser() async {
    await myDatabase.deleteUserData(user.email);
    Get.snackbar('Deleted', 'Profile Deleted successfully ');
    Get.offAll(() => LoginPage());
  }
}
