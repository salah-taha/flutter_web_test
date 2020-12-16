import 'package:flutter/material.dart';
import 'package:regestration_form/pallete.dart';

class MobileAppBar {
  static Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Enjaz',
        style: TextStyle(
          color: Pallete.darkGrey,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.2,
        ),
      ),
      centerTitle: true,
      backgroundColor: Pallete.lightGrey,
      elevation: 0,
    );
  }
}
