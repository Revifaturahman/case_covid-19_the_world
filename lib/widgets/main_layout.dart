import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget body;

  const MainLayout({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Case Covid-19 In The World",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: body,
    );
  }
}
