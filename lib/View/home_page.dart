import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Controller/profile_controller.dart';
import 'package:material_login_ui/Global_Widgets/my_editfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProfileController _controller = Get.put(ProfileController());
  var userData = Get.arguments;


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

              MyEditField(controller: _controller.nameController, hintText: userData[0]),
              MyEditField(controller: _controller.emailController, hintText: userData[1]),
              MyEditField(controller: _controller.passController, hintText: userData[2]),
              spacing(10),

              ElevatedButton(onPressed: ()async{
                _controller.DeleteUser(userData[1]);

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
