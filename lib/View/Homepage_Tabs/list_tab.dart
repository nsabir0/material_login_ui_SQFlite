import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      body: ListView.builder(
        itemCount: _controller.user.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  title: Text(_controller.user[index].name),
                  subtitle: Text(_controller.user[index].email)),
            );
          },
      )
    );
  }
}
