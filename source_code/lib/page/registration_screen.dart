import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:riseup_test/models/auth_request.dart';

import '../controller/auth_controller.dart';
import '../utils/s_size.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var formKey = GlobalKey<FormState>();
  late AuthController controller;
  late AuthRequest model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = new AuthRequest();
    controller = Get.put(AuthController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF224494),
          toolbarHeight: 0,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: sHeight(220, context),
                  child: Column(
                    children: [
                      SizedBox(
                        height: sHeight(60, context),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            'Register Here',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: sHeight(25, context),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: sHeight(40, context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: buildTextFormField(
                        context: context,
                        label: 'Email Address',
                        labelText: 'Email Address',
                        icon: Icons.person,
                        obscureText: false),
                  ),
                ),
                SizedBox(
                  height: sHeight(15, context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: buildTextFormField(
                        context: context,
                        label: 'Enter Password',
                        labelText: 'Enter Password',
                        icon: Icons.lock_outline,
                        obscureText: true),
                  ),
                ),
                SizedBox(
                  height: sHeight(40, context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    width: double.infinity,
                    height: sHeight(50, context),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 5.0)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.grey,
                          Colors.grey,
                        ],
                      ),
                      color: Colors.deepPurple.shade300,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          controller.submitRegData(model);
                          FocusScope.of(context).unfocus();
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: sWidth(20, context),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: sHeight(60, context),
                ),
              ],
            ),
          ),
        ));
  }

  buildTextFormField(
      {required BuildContext context,
      required String label,
      required String labelText,
      required IconData icon,
      required bool obscureText}) {
    return TextFormField(
      obscureText: obscureText,
      minLines: 1,
      maxLines: 1,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: label,
        focusedBorder: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
        errorBorder: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
        focusedErrorBorder: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
        filled: true,
        fillColor: Color(0xffEFF0F8),
        isDense: true,
        prefixIcon: Icon(
          icon,
          size: sHeight(25, context),
          color: Colors.grey,
        ),
      ),

      validator: (value) {
        if (labelText == 'Email Address') {
          if (value!.isEmpty) {
            return 'Email Address';
          }
        } else {
          if (value!.isEmpty) {
            return label;
          }
        }
      },
      onSaved: (value) {
        if (labelText == 'Email Address') {
          model.address = value;
        } else {
          model.password = value;
        }
      },
      // keyboardType: TextInputType.phone,
    );
  }
}
