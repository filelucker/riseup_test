import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<bool> checkConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  var connectionFlag = true;
  if (connectivityResult == ConnectivityResult.none) {
    connectionFlag = false;
  }
  return connectionFlag;
}

Future<bool> checkConnectionWithToast(context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  var connectionFlag = true;

  if (connectivityResult == ConnectivityResult.none) {
    connectionFlag = false;
    Get.snackbar('Alert!','Please check your internet connection.');
  }
  return connectionFlag;
}
