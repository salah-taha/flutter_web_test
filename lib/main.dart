import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regestration_form/pallete.dart';
import 'package:regestration_form/ui/widgets/responsive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enjaz Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Pallete.lightGrey,
      ),
      home: Responsive(),
    );
  }
}
