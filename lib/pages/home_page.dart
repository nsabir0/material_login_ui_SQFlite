import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  List country_list = [ "Bangla", "Hindi", "Urdu"];

  void _incrementList() {
    setState(() {
      print(controller.text.toString());

      country_list.add(controller.text.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    _incrementList();
                  },
                  child: const Text(
                    'Add Data',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  )),
              Expanded(
                  child: ListView.builder(
                itemCount: country_list.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(country_list[index]),
                  ));
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
