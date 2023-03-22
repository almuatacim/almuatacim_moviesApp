import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //   name: "myFireBase",
      options: FirebaseOptions(
          apiKey: "AIzaSyDgIBCSUQWFHK7f8rc2_UwXksusdjeOAKk",
          appId: "1:357334571748:android:34841386c2566d35792af1",
          messagingSenderId: "357334571748",
          projectId: "myfirebase-23788"));
  runApp(const App());
}

// class ScholarChat extends StatelessWidget {
//   const ScholarChat({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//         LoginPage.id: (context) => LoginPage(),
//         RegisterPage.id: (context) => RegisterPage(),
//       },
//       initialRoute: LoginPage.id,
//     );
//   }
// }
