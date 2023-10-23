import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Controller/signup_controller.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final SignupController _controller = Get.put(SignupController());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon:  Icon(hintText=='Email' ? Icons.email_outlined : Icons.person_outline),
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
