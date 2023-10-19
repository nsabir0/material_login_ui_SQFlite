import 'package:flutter/material.dart';
import 'package:material_login_ui/Controller/login_controller.dart';
import 'package:material_login_ui/Database/sqflite_Database.dart';
import 'package:material_login_ui/Model/userData_model.dart';
import 'package:material_login_ui/components/my_textfield.dart';
import 'package:material_login_ui/components/square_tile.dart';
import 'package:material_login_ui/View/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController _controller= Get.put(LoginController());
  MyDatabase _myDatabase = MyDatabase();


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

          //all children under this main column============================
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
                controller: _controller.emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              spacing(10),

              //password text-field==============================================
              MyTextField(
                controller: _controller.passController,
                hintText: 'Password',
                obscureText: true,
              ),

              spacing(10),

              //forgot password=================================================
              forgotPassword(),

              spacing(25),

              //login button===================================================
              ElevatedButton(
                onPressed: ()async{
                  //_controller.loginFunc();
                  /*List<userData_Model> _info= await _myDatabase.queryData();
                  for(int i=0, i < _info.length; i++){

                  }

                  if(_info[1].email==_controller.emailController.text.toString() &&
                      _info[1].password == _controller.passController.text.toString()){
                    Get.snackbar('Hello ${_controller.emailController.text.toString()}',  'Logged In successfully ');
                    print('Logged In Successfully');
                  }else {
                    Get.snackbar('Error!!!}',  'Log In Unsuccessful');
                    print('Log In Unsuccessful');
                  };*/

                  await _myDatabase.queryData();



                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text('LOG IN',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
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
