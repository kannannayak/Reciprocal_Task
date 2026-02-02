import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:task/DB/Db.dart';
import 'package:task/Home/home.dart';
import 'package:task/Login/View/Login.dart';
import 'package:task/Map/maps.dart';
import 'package:task/Registration%20Page/View/Registration.dart';

void main()async {
  // debugPrint = (String? message, {int? wrapWidth}) {
  //   // Filter out verbose system logs
  //   if (message != null &&
  //       !message.contains('VRI') &&
  //       !message.contains('DisplayState')) {
  //     print(message);
  //   }
  // };

  runApp(const MyApp());
  // runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: 
      LoginPage(),
      // Home_page(),
      // OSMMapPage(),
      // RegistrationPage(),
    );
  }
}
