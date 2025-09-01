import 'package:flutter/material.dart';
import '../provider/case_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CaseProvider>(context, listen: false);

    //   if (provider.cases.isEmpty) {
    //   return const Scaffold(body: Center(child: CircularProgressIndicator()));
    // }

    // final caseItem = provider.cases[0];

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: provider.cases.length,
          itemBuilder: (context, index) {
            final caseItem = provider.cases[index];
            return Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  children: [
                    Image.network(caseItem.flag, height: 80, width: 80),
                    SizedBox(height: 20),
                    Text(
                      caseItem.country,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      caseItem.cases.toString(),
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
