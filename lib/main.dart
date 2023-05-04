import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/routes.dart';

import 'views/stain_genius/main_stain_categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.zoom,
      initialRoute: '/',
      getPages: Routes.routes,
      title: 'FlutterPanasonicApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainStainCategories(),
      debugShowCheckedModeBanner: false,
    );
  }
}
