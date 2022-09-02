import 'package:flutter/material.dart';

import 'package:yoodule_ar/splash_screen.dart';
import 'package:yoodule_ar/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'yoodule',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Color(0xffb74093),
      // ),
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color.fromRGBO(198, 63, 83, 1),
            ),
      ),
      getPages: [
        GetPage(name: '/', page: () => splash_screen()),
        GetPage(name: home_page.routeName, page: () => home_page()),
      ],
      initialRoute: splash_screen.routeName,
    );
  }
}
