import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:riseup_test/page/home.dart';

import '../api_provider/data_api_provider.dart';
import '../models/auth_request.dart';
import '../models/email_response.dart';
import '../utils/shared_pref.dart';
import '../utils/widgets.dart';

class AuthController extends GetxController{

  bool loadedData = false;
  DataApiProvider apiProvider = DataApiProvider();
  final SharedPref sharedPref = SharedPref();
  var messages = (List<Hydra_member>.of([])).obs;
  List<Hydra_member> m = [];

  void submitRegData(AuthRequest model) async {
    var connectionState = await checkConnection();
    if (connectionState) {
      var result = await apiProvider.submitData(model);
      if (!result.error) {
        Get.back();
        Get.snackbar('Alert!','Account Created, Id: ' + result.data!.id!);

      }else{
        Get.snackbar('Alert!',result.errorMessage.toString());
      }
    } else {
      Get.snackbar('Alert!','No internet');
    }
  }

  void getTokenData(AuthRequest model) async {
    var connectionState = await checkConnection();
    if (connectionState) {
      var result = await apiProvider.tokenData(model);
      if (!result.error) {
       await sharedPref.saveString('token', result.data!.token.toString());
       await sharedPref.saveString('id', result.data!.id.toString());
        Get.to(() => Home());

      }else{
        Get.snackbar('Alert!',result.errorMessage.toString());
      }
    } else {
      Get.snackbar('Alert!','No internet');
    }
  }
  void checkEmailData() async {
    var connectionState = await checkConnection();
    if (connectionState) {
      messages.clear();
      var result = await apiProvider.emaiData();
      if (!result.error) {
        messages.addAll(result.data!.hydramember!);
        String json = jsonEncode(result.data!);

        await sharedPref.saveString('response', json);
      }else{
        Get.snackbar('Alert!',result.errorMessage.toString());
      }
    } else {
      Get.snackbar('Alert!','No internet');
    }
  }

  getOldMail() async {
    String s = await sharedPref.readString('response');
    if(s != ''){
      messages.clear();
    Map<String, dynamic> userMap = jsonDecode(s);
    var kData = EmailResponse.fromJson(userMap);
      messages.addAll(kData.hydramember!);
    }
  }

}