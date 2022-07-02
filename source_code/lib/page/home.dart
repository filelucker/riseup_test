import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riseup_test/page/details.dart';
import 'package:riseup_test/utils/s_size.dart';

import '../controller/auth_controller.dart';
import '../utils/shared_pref.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userId = '';
  late AuthController controller;
  final SharedPref sharedPref = SharedPref();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(AuthController());
    getId();
    controller.getOldMail();
  }

  void getId() async {
    userId = await sharedPref.readString('id');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RiseupLab Test'),
      ),
      body: Container(
        child: Column(children: [
          SizedBox(
            height: sHeight(10, context),
          ),
          Text('UserId: ' + userId),
          SizedBox(
            height: sHeight(10, context),
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
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () async {
                  controller.checkEmailData();
                },
                child: Obx(() => Text(
                      'Click to Check new Mail: ' +
                          controller.messages.length.toString(),
                      style: TextStyle(
                        fontSize: sWidth(20, context),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: sHeight(10, context),
          ),
          Obx(() => Expanded(
              // height: 300.0, // Change as you wish
              // width: 300.0, // Change as you wish
              child: ListView.builder(
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:
                          Text(controller.messages[index].subject.toString()),
                      subtitle: Text(
                          controller.messages[index].from!.address.toString()),
                      onTap: (){
                        Get.to(() => EmailDetails(data: controller.messages[index]));
                      },
                    );
                  }))),
        ]),
      ),
    );
  }
}
