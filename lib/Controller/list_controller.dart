import 'package:get/get.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';

class ListController extends GetxController{

  final _isLoading=false.obs;
  MyDatabase myDatabase = MyDatabase();
  late List<userData_Model> user= [
    userData_Model(name: 'name', email: 'email', password: 'password'),
    userData_Model(name: 'name1', email: 'email1', password: 'password')
  ];
  showList()async{
    user = await myDatabase.getAllUser();
  }

  isLoading() => _isLoading.value;

  timeLoading() {
    _isLoading.value=true;
    return Future.delayed(const Duration(milliseconds: 500), () {
      showList();
      _isLoading.value = false;
    });
  }

  toggleLoading() => _isLoading.value =true;
}