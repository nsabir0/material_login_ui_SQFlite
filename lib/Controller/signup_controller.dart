import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';

class SignupController extends GetxController{
  Rx<TextEditingController> nameController= TextEditingController().obs;
  Rx<TextEditingController> emailController= TextEditingController().obs;
  Rx<TextEditingController> passController= TextEditingController().obs;
  Rx<TextEditingController> cfpassController= TextEditingController().obs;

  signupFunc()async{

    userData_Model saveData = userData_Model(
        name: nameController.toString(),
        email: emailController.toString(),
        password: passController.toString(),
    );

    MyDatabase myDatabase=MyDatabase();

    userData_Model model = await myDatabase.insert(saveData);

    if(model.id!=null && model.id!=0){
      Get.snackbar('Registration',  'Data Saved successfully ${model.name}');
      print('Data Saved Successfully');
    }
    print('Error!!!');

  }
}