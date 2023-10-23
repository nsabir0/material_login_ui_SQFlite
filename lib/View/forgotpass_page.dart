import 'package:flutter/material.dart';

class ForgotpassPage extends StatelessWidget {
  const ForgotpassPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  //controller: nameController,
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
                  onTap: () {},
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

                Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('P A S S W O R D'),
                  ),

                )
              ],
            )),
      ),
    );;
  }
}

Widget spacing(double h) {
  return SizedBox(height: h);
}
