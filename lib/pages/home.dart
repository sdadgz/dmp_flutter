import 'package:demo/compoments/common/card.dart';
import 'package:demo/compoments/dmp/dmp_button.dart';
import 'package:demo/pages/dmp.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  final String title = "title";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("中心名字"),
        ),
        body: Container(
            color: Colors.white54,
            child: ListView(
              children: const [
                SCard(
                  child: Text("data"),
                )
              ],
            )),
      ),
    );
  }
}
