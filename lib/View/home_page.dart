import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Controller/list_controller.dart';
import 'Homepage_Tabs/profile_tab.dart';
import 'Homepage_Tabs/list_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0.obs;
  final ListController _controller = Get.put(ListController());

  final List<Widget> tabs = [
    const ProfileTab(),
    const Dashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: tabs[selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              selectedIndex.value = value;
              if (selectedIndex.value == 1) {
                _controller.timeLoading();
              } else {
                _controller.toggleLoading();
              }
            },
            currentIndex: selectedIndex.value,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Profile'),
              BottomNavigationBarItem(icon: Icon(Icons.view_list), label: 'List'),
            ]),
      ),
    );
  }
}
