import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Controller/signup_controller.dart';
import 'package:material_login_ui/View/login_page.dart';
import 'package:material_login_ui/Global_Widgets/my_password.dart';
import 'package:material_login_ui/Global_Widgets/my_textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final SignupController _controller = Get.put(SignupController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child:
            //all children under this main column============================
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                spacing(30.h),

///=============Icon=====================================================
                Icon(Icons.android, size: 100.h),

///=============Welcome Text==================================================
                Text('Ready to join the team?',
                    style: TextStyle(color: Colors.grey[700], fontSize: 16.sp)),

                spacing(15.h),

///=============FullName Text field===========================================
                MyTextField(
                  controller: _controller.nameController,
                  hintText: 'Full Name',
                ),

                spacing(10.h),

///=============username Text field===========================================
                MyTextField(
                  controller: _controller.emailController,
                  hintText: 'Email',
                ),

                spacing(10.h),

///=============password text-field===========================================
                MyPassField(
                  controller: _controller.passController,
                  hintText: 'Password',
                ),

                spacing(10.h),

///=============Confirm password textfield====================================
                MyPassField(
                  controller: _controller.cfpassController,
                  hintText: 'Confirm Password',
                ),

                spacing(25.h),

///=============SignIn button=================================================
                ElevatedButton(
                  onPressed: () async {
                    final FormState? form = _formKey.currentState;
                    if (form!.validate()) {
                      _controller.signupFunc();
                    }
                  },
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text('JOIN US',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp)),
                ),

                spacing(45.h),

///===============goto LoginPage text===========================================
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'Already a member?  ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                        text: 'Login Now',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _controller.nameController.clear();
                            _controller.emailController.clear();
                            _controller.passController.clear();
                            _controller.cfpassController.clear();
                            Get.offAll(() => LoginPage());
                          }),
                  ]),
                ),

                spacing(45.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget spacing(double h) {
  return SizedBox(height: h);
}
