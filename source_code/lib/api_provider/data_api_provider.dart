
import 'dart:io' as http;


import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/connect.dart';
import 'package:riseup_test/models/auth_request.dart';

import '../api/ApiResponse.dart';


import '../models/email_response.dart';
import '../models/login_response.dart';
import '../models/registration_response.dart';
import '../utils/shared_pref.dart';
import 'dio/base_api_provider.dart';

class DataApiProvider extends BaseApiProvider {
  Future<ApiResponse<RegistrationResponse>> submitData(
      AuthRequest model) async {
    try {
      var response = await getDio()
          .post('accounts',options: Options(headers: {
        http.HttpHeaders.contentTypeHeader: "application/json",
      }),
        data: jsonEncode(model),);
      print(response.data);
      return ApiResponse<RegistrationResponse>(
          data: RegistrationResponse.fromJson(response.data), error: false);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return ApiResponse<RegistrationResponse>(
          errorMessage: handleError(error), error: true);
    }
  }

  Future<ApiResponse<LoginResponse>> tokenData(
      AuthRequest model) async {
    try {
      var response = await getDio()
          .post('token',options: Options(headers: {
        http.HttpHeaders.contentTypeHeader: "application/json",
      }),
        data: jsonEncode(model),);
      print(response.data);
      return ApiResponse<LoginResponse>(
          data: LoginResponse.fromJson(response.data), error: false);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return ApiResponse<LoginResponse>(
          errorMessage: handleError(error), error: true);
    }
  }

  Future<ApiResponse<EmailResponse>> emaiData() async {
    try {
      SharedPref sharedPref = SharedPref();
      var response = await getDio().get('messages',
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${await sharedPref.readString('token')}'
          }));
      print(response.data);
      return ApiResponse<EmailResponse>(
          data: EmailResponse.fromJson(response.data),
          error: false);
    } catch (error, stacktrace) {
      // debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return ApiResponse<EmailResponse>(
          errorMessage: handleError(error), error: true);
    }
  }

}
