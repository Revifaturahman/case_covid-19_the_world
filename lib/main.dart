import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/data/models/case_model.dart';
import 'package:flutter_application_4/presentation/ui/detail_page.dart';
import 'presentation/ui/home_page.dart';
import 'presentation/provider/case_provider.dart';
import 'data/repository/case_repository.dart';
import 'data/service/api_service.dart';
import 'package:provider/provider.dart';
import 'presentation/ui/detail_page.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Covid Cases',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      // routes: {
      //   // "/": (_) => const HomePage(),
      //   "/detail": (_) => const DetailPage()
      // },
      onGenerateRoute: (settings) {
        if (settings.name == "/detail") {
          final caseItem = settings.arguments as Case;
          return MaterialPageRoute(
            builder: (_) => DetailPage(caseItem: caseItem),
          );
        }
        return null;
      },
    );
  }
}
