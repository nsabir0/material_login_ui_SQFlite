import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_login_ui/Controller/login_controller.dart';
import 'package:material_login_ui/Global_Widgets//my_password.dart';
import 'package:material_login_ui/Global_Widgets/my_textfield.dart';
import 'package:material_login_ui/Global_Widgets/square_tile.dart';
import 'package:material_login_ui/View/forgotpass_page.dart';
import 'package:material_login_ui/View/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController _controller = Get.put(LoginController());
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                spacing(50.h),

                ///Lock icon=====================================================
                Icon(Icons.android, size: 100.dm),


                ///Welcome Text==================================================
                Text('Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16.sp,
                    )),

                spacing(25.h),

                ///username Text field===========================================
                MyTextField(
                  controller: _controller.emailController,
                  hintText: 'Email',
                ),

                spacing(10.h),

                ///password text-field===========================================
                MyPassField(
                  controller: _controller.passController,
                  hintText: 'Password',
                ),

                spacing(10.h),

                ///forgot password===============================================
                forgotPassword(),

                spacing(25.h),

                ///login button==================================================
                ElevatedButton(
                  onPressed: () async {
                    final FormState? form = formKey.currentState;
                    if (form!.validate()) {
                      _controller.loginFunc();
                    }
                  },
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                ),

                spacing(40.h),

                ///OR decider====================================================
                orDivider(),

                spacing(40.h),

                ///two buttons===================================================
                socialButtons(),

                spacing(45.h),

                ///register text=================================================
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: 'Not a member?  ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                    text: 'Register Now',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                      _controller.emailController.clear();
                      _controller.passController.clear();
                        Get.to(() => const Signup());
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

Widget forgotPassword() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
    child: InkWell(
      onTap: () {
        Get.to(const ForgotpassPage());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Forgot Password?',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    ),
  );
}

Widget orDivider() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
    child: Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1.h,
            color: Colors.grey[500],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Text(
            'Or continue with',
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1.h,
            color: Colors.grey[500],
          ),
        ),
      ],
    ),
  );
}

Widget socialButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SquareTile(imagePath: 'lib/images/google.png'),
      SizedBox(width: 25.h),
      const SquareTile(imagePath: 'lib/images/apple.png')
    ],
  );
}

Widget spacing(double h) {
  return SizedBox(height: h);
}
