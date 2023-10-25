import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Controller/profile_controller.dart';
import 'package:material_login_ui/Global_Widgets/my_editfield.dart';
import 'package:material_login_ui/Global_Widgets/my_texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProfileController _controller = Get.put(ProfileController());
  RxBool isEditCard = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              spacing(30.h),

              //Profile icon=====================================================
              Icon(Icons.person, size: 80.dm),

              spacing(10.h),

              //Welcome Text==================================================
              Text('Welcome back, This is your Profile',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16.sp)),

              spacing(10.h),

              Obx(
                () => isEditCard.value
                    ? MyTexts(
                        name: _controller.user.name,
                        email: _controller.user.email,
                        password: _controller.user.password)
                    : MyEditField(
                        name: _controller.user.name,
                        email: _controller.user.email,
                        password: _controller.user.password),
              ),

              spacing(10.h),

              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      isEditCard.value
                          ? ElevatedButton(
                              onPressed: () async {
                                Get.defaultDialog(
                                    title: "Alert !!!",
                                    middleText: "This will delete your profile permanently. Are you sure?",
                                    radius: 10,
                                    actions: [
                                      ElevatedButton(
                                        child: const Text("Cancel"),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                          _controller.deleteUser();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red[900]),
                                        child: const Text("Continue"),
                                      )
                                    ]);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[900]),
                              child: Text('Delete Profile',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp)),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                isEditCard.value = !isEditCard.value;
                                _controller.nameController.clear();
                                _controller.emailController.clear();
                                _controller.passController.clear();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[900]),
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp)),
                            ),
                      SizedBox(width: 10.w),
                      isEditCard.value
                          ? editButton(isEditCard)
                          : ElevatedButton(
                              onPressed: () async {
                                _controller.saveFunc();
                                isEditCard.value = !isEditCard.value;
                              },
                              child: Text('Save Profile',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp)),
                            ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget spacing(double h) {
  return SizedBox(height: h);
}

Widget editButton(RxBool isEditCard) {
  return ElevatedButton(
    onPressed: () async {
      isEditCard.value = !isEditCard.value;
    },
    child: Text('Edit Profile',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp)),
  );
}
