// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yoodule_ar/home_page.dart';

class splash_screen extends StatefulWidget {
  static const routeName = '/splash_screen';

  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 50),
      () => Navigator.pushReplacementNamed(context, home_page.routeName),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: Container(
            child: Image.asset(
              'assets/images/yoodule_logo.jpg',
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
