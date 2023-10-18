import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';

class LoginController extends GetxController{
  Rx<TextEditingController> emailController= TextEditingController().obs;
  Rx<TextEditingController> passController= TextEditingController().obs;


  loginFunc()async{

    MyDatabase myDatabase=MyDatabase();
    List<userData_Model> UserDataList= await myDatabase.getUserDataList();


  }
}