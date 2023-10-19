import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';

class LoginController extends GetxController{
  TextEditingController emailController= TextEditingController();
  TextEditingController passController= TextEditingController();


  loginFunc()async{

    if (emailController.toString() ==null &&
        passController.toString()== null){
      Get.snackbar('Empty Field',  'Please fill up the field');
      print('Empty Field');
    }

    MyDatabase myDatabase=MyDatabase();
    List<userData_Model> UserDataList= await myDatabase.getUserDataByEmail(emailController.toString());



    /*if(emailController.toString() == UserDataList. && passController.toString() == UserDataList.){


      Get.snackbar('LOG IN',  'Successful ${emailController.toString()}');
      print('Login Successful');
    } else {
      Get.snackbar(
          'LOG IN', 'unsuccessful ${emailController.toString()}');
      print('Login unsuccessful');
    }*/




  }
}