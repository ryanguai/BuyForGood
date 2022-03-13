import 'package:authfirebase/HomePage.dart';
import 'package:authfirebase/Start.dart';
import 'package:authfirebase/Login.dart';
import 'package:authfirebase/SignUp.dart';
import 'package:flutter/material.dart';
import 'Start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'category_list.dart';
import 'shoplist.dart';
import 'view_product.dart';
import 'chat.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange
      ),
      debugShowCheckedModeBanner: false,
      home: Shop(),
      //CategoryPage(title: 'BuyForGood', image: 'assets/images/background.jpg', tag: 'check'), //initial screen
      routes: <String,WidgetBuilder>{
        "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "start":(BuildContext context)=>Start(),
        '/viewproduct': (context) => ViewProductPage(),
      },
    );
  }
}

