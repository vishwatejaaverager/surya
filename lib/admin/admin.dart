import 'package:flutter/material.dart';
import 'package:surya/home.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  List stores = ["store 1", "store 2", "store 3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: stores.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ));
                },
                title: Text(stores[index]),
              );
            },
          ))
        ],
      ),
    );
  }
}
