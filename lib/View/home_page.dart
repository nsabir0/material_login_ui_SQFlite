import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Controller/profile_controller.dart';
import 'package:material_login_ui/Global_Widgets/my_editfield.dart';
import 'package:material_login_ui/Model/userData_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProfileController _controller = Get.put(ProfileController());
  userData_Model user = Get.arguments[0];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              spacing(30),

              //Lock icon=====================================================
              const Icon(Icons.person, size: 100),

              spacing(10),

              //Welcome Text==================================================
              Text('Welcome back, This is your Profile',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16)),

              spacing(10),

              MyEditField(controller: _controller.nameController, hintText: user.name),
              MyEditField(controller: _controller.emailController, hintText: user.email),
              MyEditField(controller: _controller.passController, hintText: user.password),
              spacing(10),

              ElevatedButton(onPressed: ()async{

                _controller.DeleteUser(user.email);

              },
                style:
                ElevatedButton.styleFrom(backgroundColor: Colors.red[900]),
                child: const Text(
                  'Delete Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),)


            ],
          ),
        ),
      ),
    );
  }
}

Widget spacing(double h) {
  return SizedBox(height: h);
}
