
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'presentation/ui/home_page.dart';
import 'presentation/provider/case_provider.dart';
import 'data/repository/case_repository.dart';
import 'data/service/api_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              CaseProvider(CaseRepository(ApiService()))
                ..loadCase(), // otomatis load saat provider dibuat
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Cases',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
