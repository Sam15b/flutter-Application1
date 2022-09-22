import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/store.dart';
import 'package:flutter_application_1/Widget/themes.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/feedback_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utilies/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  int day = 30;
  String name = "Alipur";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.HomeRoutes,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.HomeRoutes: (context) => HomePage(),
        "/feedback": (context) => FeedBackPage(),
        MyRoutes.loginRoutes: (context) => LoginPage(),
        MyRoutes.cartRoutes: (context) => CartPage()
      },
    );
  }
}
