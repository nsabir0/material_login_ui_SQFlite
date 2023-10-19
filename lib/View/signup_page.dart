import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Controller/signup_controller.dart';
import 'package:material_login_ui/View/login_page.dart';
import 'package:material_login_ui/components/my_button.dart';
import 'package:material_login_ui/components/my_textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final SignupController _controller= Get.put(SignupController());


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {

  }

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
                spacing(30),

                //Lock icon=======================================================
                const Icon(Icons.android, size: 100),

                //Welcome Text====================================================
                Text(
                  'Ready to join the team?',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),

                spacing(15),

                //Fullname Text field==============================================
                MyTextField(
                  controller: _controller.nameController,
                  hintText: 'Full Name',
                  obscureText: false,
                ),

                spacing(10),

                //username Text field==============================================
                MyTextField(
                  controller: _controller.emailController,
                  hintText: 'Username',
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

                //Confirm password textfield==============================================
                MyTextField(
                  controller: _controller.cfpassController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                spacing(25),

                //signin button===================================================
                ElevatedButton(
                  onPressed: (){
                    final FormState? form = _formKey.currentState;
                    if (form!.validate()) {
                      print('Form is valid');
                      if (_controller.passController!= _controller.cfpassController){
                        //_controller.cfpassController.clear();
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Alert !'),
                            content: const Text('Password didn\'t match.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                      else {
                       //_controller.signupFunc();
                      }
                    } else {
                      print('Form is invalid');
                    }
                    //_controller.signupFunc();
                    //Get.to(LoginPage());
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text('JOIN US',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),

                spacing(45),

                //register text===================================================
                loginNowText(),

                spacing(45),
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

Widget loginNowText() {
  return RichText(
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
              Get.to(const Signup());
            }),
    ]),
  );
}
