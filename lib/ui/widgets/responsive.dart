import 'package:flutter/material.dart';
import 'package:regestration_form/ui/screens/register_screen.dart';

class Responsive extends StatelessWidget {
  static bool isMobile(BuildContext ctx) => MediaQuery.of(ctx).size.width < 900;
  static bool isDesktop(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width >= 900;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: LayoutBuilder(
        builder: (ctx, constrains) {
          return RegisterScreen();
        },
      ),
    );
  }
}
