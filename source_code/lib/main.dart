
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// import 'package:provider/provider.dart';
import 'package:riseup_test/page/splash.dart';

import 'main.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await $initGetIt(getIt);

void main() async {
  await dotenv.load(fileName: ".env");
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      // MultiProvider(
      // providers: [
      //   ChangeNotifierProvider(create: (context) => DataProvider()),
      // ],
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Riseup Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      // ),
    );
  }
}
