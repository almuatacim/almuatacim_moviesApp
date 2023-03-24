import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/pages/activity_page/activity_Page.dart';
import 'package:flutter_application_1/view/pages/homepage/homepage.dart';
import 'package:flutter_application_1/view/pages/loginpage/data/model/User.dart';
import 'package:flutter_application_1/view/pages/loginpage/login_page.dart';
import 'package:flutter_application_1/view/pages/regiterpage/register_page.dart';

import '../pages/homepage/moviePage.dart';

class AppRoute {
  static const String registerpage = "RegisterPage";
  static const String loginpage = "/";
  static const String homepage = "HomePage";
  static const String activityPage = "ActivityPage";
  static const String moviePage = "moviePage";

  static Route<dynamic> ongenratedRoute(RouteSettings routesettings) {
    switch (routesettings.name) {
      case homepage:
        var user = routesettings.arguments as User?;
        return MaterialPageRoute(
          builder: (context) => HomePage(
            user: user ?? User(username: "username", password: "password"),
            // user: User(password: "", username: ""),
          ),
        );
      case loginpage:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case moviePage:
        return MaterialPageRoute(
          builder: (context) => MoviesPage(),
        );
      case activityPage:
        return MaterialPageRoute(
          builder: (context) => MoviesPage(),
        );
      case registerpage:
        return MaterialPageRoute(
          builder: (context) => RegisterPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text("No Route Found !!!")]),
          ),
        );
    }
  }
}

// class AppRoute {
// static const String homepage - "/" ,
// static const String loginpage = "/Loginpage";
// static ongenratedRoute(RouteSettings routesettings) {
// switch (routesettings. name) {
// case homepage:
// return MaterialPageRoute(bui1der: (context)
// case loginPage:
// return MaterialPageRoute(bui1der: (context)
// default:
// I return MaterialpageRoute(bui1der : (context)
// scaffold (body: columnc&lildrun:
// Text
// "NO Route Found ! "