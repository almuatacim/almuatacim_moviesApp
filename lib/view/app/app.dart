import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/pages/homepage/homepage.dart';
import 'package:flutter_application_1/view/route/approute.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      title: ("My App"),
      initialRoute: AppRoute.loginpage,
      onGenerateRoute: AppRoute.ongenratedRoute,
    );
  }
}
