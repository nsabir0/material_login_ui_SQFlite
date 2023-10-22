import 'package:flutter/material.dart';
import 'package:material_login_ui/Controller/login_controller.dart';
import 'package:material_login_ui/Global_Widgets//my_password.dart';
import 'package:material_login_ui/Global_Widgets/my_textfield.dart';
import 'package:material_login_ui/Global_Widgets/square_tile.dart';
import 'package:material_login_ui/View/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController _controller = Get.put(LoginController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                spacing(50),

                //Lock icon=====================================================
                const Icon(Icons.android, size: 100),

                spacing(50),

                //Welcome Text==================================================
                Text('Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    )),

                spacing(25),

                //username Text field===========================================
                MyTextField(
                  controller: _controller.emailController,
                  hintText: 'Email',
                ),

                spacing(10),

                //password text-field===========================================
                MyPassField(
                  controller: _controller.passController,
                  hintText: 'Password',
                ),

                spacing(10),

                //forgot password===============================================
                forgotPassword(),

                spacing(25),

                //login button==================================================
                ElevatedButton(
                  onPressed: () async {

                    final FormState? form = _formKey.currentState;
                    if (form!.validate()) {
                      print('Form is valid');

                      _controller.loginFunc();
                    }
                  },
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text(
                    'LOG IN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),

                spacing(45),

                //OR decider====================================================
                orDivider(),

                spacing(45),

                //two buttons===================================================
                socialButtons(),

                spacing(45),

                //register text=================================================
                registerNowText(),

                spacing(45),
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
