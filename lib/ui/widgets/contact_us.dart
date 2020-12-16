import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regestration_form/pallete.dart';
import 'package:regestration_form/ui/widgets/done_dialog.dart';
import 'package:regestration_form/ui/widgets/input_field.dart';
import 'package:regestration_form/ui/widgets/responsive.dart';
import 'package:regestration_form/ui/widgets/rounded_button.dart';

class ContactUs extends StatelessWidget {
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isMobile(context) ? Get.width * 0.9 : Get.width * 0.5,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputField(
              label: 'Name',
              hint: 'John Smith',
              controller: nameController,
              validate: (String name) =>
                  name.trim().isEmpty ? "Please Enter Your Name" : null,
            ),
            InputField(
              label: 'Email',
              hint: 'Smith@gmail.com',
              validate: (String email) =>
                  email.isEmail ? null : "Please Enter a valid Email",
            ),
            InputField(
              label: 'Message',
              hint: 'Your Message',
              maxLines: 8,
              validate: (String message) =>
                  message.trim().isEmpty ? "Please Enter Your Message." : null,
            ),
            RoundedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  Get.back(closeOverlays: true);
                  Get.defaultDialog(
                    title: "Message Sent",
                    content: DoneDialog(
                      message:
                          'Thank you ${nameController.text} For Contacting Us.',
                    ),
                    onCancel: () {
                      Get.back(closeOverlays: true);
                    },
                    cancel: RoundedButton(
                      onPressed: () {
                        Get.back(closeOverlays: true);
                      },
                      icon: Icon(Icons.check),
                      label: Text('Done'),
                      width: 120,
                      color: Pallete.green,
                      labelColor: Pallete.light,
                    ),
                  );
                }
              },
              icon: Icon(Icons.send),
              label: Text('Send'),
              width: 100,
              color: Pallete.green,
              labelColor: Pallete.light,
            ),
          ],
        ),
      ),
    );
  }
}
