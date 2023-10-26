import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Controller/profile_controller.dart';

class MyEditField extends StatelessWidget {

  final String name, email, password;

  const MyEditField({
    super.key,

    required this.name,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileController controllerP = Get.put(ProfileController());

    return Card(
      elevation: 20,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical:  10.h),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
              child: Card(
                elevation: 20,
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: Icon(Icons.account_circle)),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        autofocus: true,
                        controller: controllerP.nameController,
                        decoration: InputDecoration(
                          hintText: name,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
              child: Card(
                elevation: 20,
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: Icon(Icons.alternate_email)),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: controllerP.emailController,
                        decoration: InputDecoration(
                          hintText: email,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
              child: Card(
                elevation: 20,
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: Icon(Icons.lock_outline)),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: controllerP.passController,
                        decoration: InputDecoration(
                          hintText: password,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
