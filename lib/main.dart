import 'package:flutter/material.dart';
import 'package:login_finance/home/home_page.dart';
import 'package:login_finance/login/login_page.dart';
import 'package:login_finance/signUp/sign_up_page.dart';
///ALL RIGHTS ARE RESERVED TO <<Oussama Aalaila>> :)

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      routes: {
        '/login': (context)=> LoginPage(),
        '/signUp': (context)=>SignUpPage(),
        '/home': (context)=>MyHomePage()
      },
      home: LoginPage()

    );
  }
}
