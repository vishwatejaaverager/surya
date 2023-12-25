import 'package:flutter/material.dart';
import 'package:surya/admin/admin.dart';
import 'package:surya/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _names = ["onions", "tamato", "potatoes", "eggs", "cow milk"];
  final List _prices = ["22", "40", "60", "80", "30"];
  int tamount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store "),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ));
              },
              icon: const Icon(Icons.admin_panel_settings))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sold",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(tamount.toString())
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: _names.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  _names[index],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        var a = tamount - int.parse(_prices[index]);
                        tamount = a;
                        setState(() {});
                      },
                      child: const Text(
                        "-- ",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    const Text("Click To Add or Remove"),
                    InkWell(
                        onTap: () {
                          var a = tamount + int.parse(_prices[index]);
                          tamount = a;
                          setState(() {});
                        },
                        child: const Icon(Icons.add)),
                  ],
                ),
                trailing: Text(
                  "Price ${_prices[index]}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
