import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Controller/signup_controller.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final SignupController _controller = Get.put(SignupController());
    RxBool passOnOff = false.obs;
    if (obscureText==true) {
      passOnOff = true.obs;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_outlined),
          suffixIcon: Obx(() =>InkWell(
            onTap: () {
              passOnOff.value=!passOnOff.value;
            },
            child:  Icon(passOnOff.value
                ? Icons.visibility_off
                : Icons.visibility),

          ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintText';
          } else if (value == _controller.cfpassController.text.toString()) {
            if (_controller.passController.text.toString() != value) {
              return 'Confirm Password Didn\'t Match.';
            }
          }
        },
      ),
    );
  }
}
