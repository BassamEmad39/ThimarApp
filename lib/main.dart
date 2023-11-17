import 'package:flutter/material.dart';
import 'package:untitled3/core/logic/helper_methods.dart';
import 'package:untitled3/views/auth/create_new_password/view.dart';
import 'package:untitled3/views/auth/forget_password/view.dart';
import 'package:untitled3/views/auth/login/view.dart';
import 'package:untitled3/views/auth/register/view.dart';
import 'package:untitled3/views/auth/splash/view.dart';
import 'package:untitled3/views/my_orders/view.dart';
import 'package:untitled3/views/notifications/view.dart';

void main() {
  runApp(StartView());
}

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: "Bassam App",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff4C8613),
          ),
          ),
          primarySwatch: MaterialColor(0xff4C8613, {
            50: Color(0xff4C8613).withOpacity(0.1),
            100: Color(0xff4C8613).withOpacity(0.2),
            200: Color(0xff4C8613).withOpacity(0.3),
            300: Color(0xff4C8613).withOpacity(0.4),
            400: Color(0xff4C8613).withOpacity(0.5),
            500: Color(0xff4C8613).withOpacity(0.6),
            600: Color(0xff4C8613).withOpacity(0.7),
            700: Color(0xff4C8613).withOpacity(0.8),
            800: Color(0xff4C8613).withOpacity(0.9),
            900: Color(0xff4C8613),
          }),
          filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                      fixedSize: Size.fromHeight(60)
              )
          ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
              side: BorderSide( color: Color(0xff4C8613))

      )
        ),
        inputDecorationTheme: InputDecorationTheme(

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Color(0xffF3F3F3))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Color(0xffF3F3F3))),
        )
      ),
      builder: (context, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      home: CreateNewPasswordView(),
    );
  }

}
