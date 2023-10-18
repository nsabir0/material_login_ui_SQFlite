import 'package:flutter/material.dart';
import 'package:material_login_ui/components/my_button.dart';
import 'package:material_login_ui/components/my_textfield.dart';
import 'package:material_login_ui/components/square_tile.dart';
import 'package:material_login_ui/View/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:

      //For Scrolling=======================================================
      SingleChildScrollView(
        child: Center(
          child:

          //all childrens under this main column============================
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              //Lock icon=======================================================
              const Icon(Icons.android, size: 100),

              const SizedBox(height: 50),

              //Welcome Text====================================================
              Text('Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  )
              ),

              spacing(25),

              //username Text field==============================================
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              spacing(10),

              //password text-field==============================================
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              spacing(10),

              //forgot password=================================================
              forgotPassword(),

              spacing(25),

              //signing button===================================================
              MyButton(
                onPressed: signUserIn,
                buttonText: 'Sign In',
              ),

              spacing(45),

              //OR decider===============================
              orDivider(),

              spacing(45),

              //two buttons=====================================================
              socialButtons(),

              spacing(45),

              //register text===================================================
              registerNowText(),

              spacing(45),
            ],
          ),
        ),
      ),
    );
  }
}

Widget forgotPassword() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    ),
  );
}

Widget orDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey[500],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Or continue with',
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey[500],
          ),
        ),
      ],
    ),
  );
}

Widget socialButtons() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SquareTile(imagePath: 'lib/images/google.png'),
      SizedBox(width: 25),
      SquareTile(imagePath: 'lib/images/apple.png')
    ],
  );
}

Widget spacing(double h) {
  return SizedBox(height: h);
}

Widget registerNowText() {
  return RichText(
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
              Get.to(const Signup());
            }),
    ]),
  );
}
