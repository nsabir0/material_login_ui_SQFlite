import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';

class ForgotpassController extends GetxController{

  TextEditingController searchController=TextEditingController();
  var pass='P A S S W O R D'.obs;

searchFunc()async{
  MyDatabase myDatabase = MyDatabase();

  userData_Model user = await myDatabase.queryData(searchController.text.toString());

  if(user.id!=null && user.id!=0){
    pass.value=user.password;
    Get.snackbar('Hello ${user.name}',  'User found');

  }else {
    Get.snackbar('Error!!!', 'User Not found');
  }

}
}