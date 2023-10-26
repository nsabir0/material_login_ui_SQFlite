import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_login_ui/Controller/list_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ListController _controller = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Card(
              elevation: 20,
              color: Colors.deepPurple[200],
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('All User from Database',
                    style: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              child: Obx(
                () => _controller.isLoading()
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        itemCount: _controller.user.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.deepPurple[100],
                            child: ListTile(
                                title: Text(_controller.user[index].name),
                                subtitle: Text(_controller.user[index].email)),
                          );
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
