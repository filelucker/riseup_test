import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riseup_test/page/home.dart';

import '../utils/shared_pref.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  SharedPref sharedPref = SharedPref();
  late Animation _contentAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _contentAnimation = Tween(begin: 0.0, end: 60.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.20, 0.40, curve: Curves.easeOut)));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        print('end anim');
        String s = await sharedPref.readString('token') ?? '';
        // if(s != ''){Get.off(() => Home());}else {
          Get.off(() => LoginScreen());
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: DefaultTextStyle(
          style: TextStyle(
              fontSize: _contentAnimation.value,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          child: Text(
            "Hi,",
          ),
        ),
      ),
    );
  }
}
