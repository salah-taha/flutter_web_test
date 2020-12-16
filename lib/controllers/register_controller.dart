import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:regestration_form/models/user_model.dart';
import 'package:regestration_form/pallete.dart';
import 'package:regestration_form/ui/widgets/done_dialog.dart';

class RegisterController extends GetxController {
  // Form Key
  var formKey = GlobalKey<FormState>();

  // Form Fields Controllers
  var fullName = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  // Countries Data
  List _countriesData;

  var _selectedCountry = RxString(null);
  var _selectedState = RxString(null);
  var _states = Rx<List>([]);

  // loading indicator to show loading while getting data from assets
  var loading = RxBool(false);

  @override
  void onInit() {
    // load data on app start
    _loadData();

    // set States Each time selected country changed
    ever(_selectedCountry, _setStates);

    super.onInit();
  }

  // getters
  List get getStates => _states.value;
  String get getSelectedCountry => _selectedCountry.value;
  String get getSelectedState => _selectedState.value;
  List get getCountries => _countriesData.map((e) => e['country']).toList();

  void _loadData() async {
    loading.value = true;
    //load data from Asset
    String data = await rootBundle.loadString("assets/countries.json");
    //deconding the data
    final jsonResult = json.decode(data);
    _countriesData = jsonResult['countries'];
    loading.value = false;
  }

  void selectCountry(String country) {
    // When Country Changed set selectedState to null in order to not show an error
    _selectedState.value = null;
    _selectedCountry.value = country;
  }

  void selectState(String state) {
    _selectedState.value = state;
  }

  void _setStates(String selectedCountry) {
    //get states
    var countryData = _countriesData.firstWhere(
        (element) => element['country'].toString() == selectedCountry,
        orElse: () => null);
    if (countryData != null) {
      _states.value = countryData['states'];
    } else
      Get.snackbar('Error', 'This Country is not Found.');
  }

  void _clearForm() {
    fullName.text = '';
    email.text = '';
    password.text = '';
    _selectedCountry.value = null;
    _selectedState.value = null;
  }

  void submit() {
    try {
      if (formKey.currentState.validate()) {
        UserModel user = UserModel(
          fullName: fullName.text,
          country: _selectedCountry.value,
          state: _selectedState.value,
          email: email.text,
          password: password.text,
        );
        Get.defaultDialog(
          radius: 5.0,
          title: 'Done',
          backgroundColor: Pallete.midGrey,
          actions: [
            RaisedButton(
              child: Text('Clear Form'),
              onPressed: () {
                _clearForm();
                Get.back(closeOverlays: true);
              },
              color: Pallete.lightGrey,
              textColor: Pallete.darkGrey,
            ),
            RaisedButton(
              child: Text('Done'),
              onPressed: () {
                Get.back(closeOverlays: true);
              },
              color: Pallete.green,
              textColor: Pallete.light,
            ),
          ],
          content: DoneDialog(
            message: "${user.fullName}, You Registered Successfuly.",
          ),
        );
      }
    } catch (e) {
      Get.snackbar('Error', e.message);
    }
  }
}
