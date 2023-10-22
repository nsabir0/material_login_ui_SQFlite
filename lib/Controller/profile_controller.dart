import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';
import 'package:material_login_ui/View/login_page.dart';

class ProfileController extends GetxController{

  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passController= TextEditingController();


  MyDatabase myDatabase=MyDatabase();


  saveFunc () async {

    print(nameController.text.toString());
    print(passController.text.toString());
  userData_Model saveData = userData_Model(
  name: nameController.text.toString(),
  email: emailController.text.toString(),
  password: passController.text.toString(),
  );




  var returnedid = await myDatabase.updateUserData(saveData);

  print('$returnedid');
}

  DeleteUser(int id)async{
    await myDatabase.deleteUserData(id);
    Get.snackbar('Deleted',  'Data Deleted successfully ');
    Get.to(LoginPage());
  }



}