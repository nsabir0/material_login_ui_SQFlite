import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';

class SignupController extends GetxController{
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passController= TextEditingController();
  TextEditingController cfpassController= TextEditingController();

  signupFunc()async{

    userData_Model saveData = userData_Model(
      name: nameController.text.toString(),
      email: emailController.text.toString(),
      password: passController.text.toString(),
    );

    MyDatabase myDatabase=MyDatabase();

    //List<userData_Model> userList = await myDatabase.getUserDataList();

    userData_Model model = await myDatabase.insert(saveData);

    nameController.clear();
    passController.clear();
    emailController.clear();
    cfpassController.clear();
    
    if(model.id!=null && model.id!=0){
      Get.snackbar('Hello ${model.name}',  'Data Saved successfully ');
      print('Data Saved Successfully');
    }else {
      Get.snackbar('Error!!!', 'Data Didn\'t Saved');
      print('Error!!!');
    }
  }
}