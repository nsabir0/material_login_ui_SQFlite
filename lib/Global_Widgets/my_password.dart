import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Controller/signup_controller.dart';

class MyPassField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const MyPassField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final SignupController controllerS = Get.put(SignupController());
    var passOnOff = true.obs;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Obx(() =>TextFormField(
        controller: controller,
        obscureText: passOnOff.value,
        decoration: InputDecoration(
          prefixIcon:  Icon(hintText=='Password' ? Icons.lock_outlined : Icons.lock_clock_outlined),
          suffixIcon: InkWell(
            onTap: () {
              passOnOff.value=!passOnOff.value;
            },
            child:  Icon(passOnOff.value
                ? Icons.visibility_off
                : Icons.visibility),

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
          } else if (value == controllerS.cfpassController.text.toString()) {
            if (controllerS.passController.text.toString() != value) {
              return 'Confirm Password Didn\'t Match.';
            }
          }
          return null;
        },
      ),
    ),
    );
  }
}
