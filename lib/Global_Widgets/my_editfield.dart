import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Controller/profile_controller.dart';

class MyEditField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const MyEditField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileController _controller = Get.put(ProfileController());

    return Card(
      elevation: 20,
      child: Row(
        children: [
          const Expanded(flex: 1, child: Icon(Icons.account_circle)),
          Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () async {
                    _controller.saveFunc();
                  },
                  icon: const Icon(Icons.edit_note)))
        ],
      ),
    );
  }
}
