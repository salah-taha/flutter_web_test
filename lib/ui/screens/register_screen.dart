import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regestration_form/controllers/register_controller.dart';
import 'package:regestration_form/pallete.dart';
import 'package:regestration_form/ui/desktop_widgets/desktop_appBar.dart';
import 'package:regestration_form/ui/mobile_widgets/mobile_appBar.dart';
import 'package:regestration_form/ui/widgets/contact_us.dart';
import 'package:regestration_form/ui/widgets/dropdown_button.dart';
import 'package:regestration_form/ui/widgets/input_field.dart';
import 'package:regestration_form/ui/widgets/responsive.dart';
import 'package:regestration_form/ui/widgets/rounded_button.dart';

class RegisterScreen extends StatelessWidget {
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Responsive.isDesktop(context)
          ? SizedBox.shrink()
          : FloatingActionButton.extended(
              icon: Icon(Icons.mail),
              label: Text('Contact Us'),
              onPressed: () {
                Get.defaultDialog(title: 'Contact Us', content: ContactUs());
              },
              backgroundColor: Pallete.darkGrey,
            ),
      appBar: Responsive.isDesktop(context)
          ? DesktopAppBar.build(context)
          : MobileAppBar.build(context),
      body: Obx(() {
        if (controller.loading.value)
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        return Center(
          child: Container(
            width: Responsive.isDesktop(context) ? Get.width * 0.4 : Get.width,
            child: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'Create an Account.',
                      style: TextStyle(
                        color: Pallete.darkGrey,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  InputField(
                    label: 'Full Name',
                    hint: 'John Duo',
                    controller: controller.fullName,
                    validate: (String name) =>
                        name.trim().isEmpty ? 'Please Enter Your Name' : null,
                  ),
                  InputField(
                    label: 'Email Address',
                    hint: 'John@email.com',
                    controller: controller.email,
                    validate: (String email) =>
                        email.isNotEmpty && email.isEmail
                            ? null
                            : 'Please Enter a valid Email',
                  ),
                  InputField(
                    label: 'Password',
                    hint: '********',
                    hideInput: true,
                    controller: controller.password,
                    validate: (String pass) =>
                        pass.isNotEmpty && pass.length >= 8
                            ? null
                            : 'Password Must be 8 or More Characters',
                  ),
                  Obx(
                    () => DropdownButtonCustom(
                      items: controller.getCountries,
                      onChanged: (val) {
                        controller.selectCountry(val);
                      },
                      value: controller.getSelectedCountry,
                      hint: 'Select Country',
                      label: 'Country',
                      validate: (String country) =>
                          country != null ? null : 'Please Choose Your Country',
                    ),
                  ),
                  Obx(
                    () => DropdownButtonCustom(
                      items: controller.getStates,
                      onChanged: (val) {
                        controller.selectState(val);
                      },
                      value: controller.getSelectedState,
                      hint: 'Select State',
                      label: 'State',
                      validate: (String state) =>
                          state != null ? null : 'Please Choose Your State',
                    ),
                  ),
                  RoundedButton(
                    icon: Icon(Icons.arrow_forward),
                    label: Text('Continue'),
                    onPressed: () {
                      controller.submit();
                    },
                    width: 180.0,
                    color: Pallete.green,
                    labelColor: Pallete.light,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
