import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_login_ui/Controller/forgotpass_controller.dart';
import 'package:material_login_ui/View/login_page.dart';

class ForgotpassPage extends StatefulWidget {
  const ForgotpassPage({super.key});

  @override
  State<ForgotpassPage> createState() => _ForgotpassPageState();
}

class _ForgotpassPageState extends State<ForgotpassPage> {
  @override
  Widget build(BuildContext context) {

    ForgotpassController _controller=Get.put(ForgotpassController());
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Welcome Logo field==============================================
                SizedBox( height: 150,
                    child: Image.asset('lib/images/avatar_male.png')),

                //Search Text field==============================================
                Text(
                  'Search by email',
                  style: TextStyle(color: Colors.grey[800], fontSize: 16),
                ),

                const SizedBox(height: 25),

                //Search Text field=================================================
                TextFormField(
                  controller: _controller.searchController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email_rounded),
                    suffixIcon: Icon(Icons.search),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email address.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                //Search Button======================================================
                InkWell(
                  onTap: () {
                    _controller.searchFunc();
                  },
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),

                spacing(20),
                //view password=====================================

                Obx(() => Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(_controller.pass.value),
                  ),

                ),)
              ],
            )),
      ),
    );;
  }
}

Widget spacing(double h) {
  return SizedBox(height: h);
}
