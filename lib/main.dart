import 'package:bytelogiktask/Home/Home_page.dart';
import 'package:bytelogiktask/Login/login.dart';
import 'package:bytelogiktask/Signup/Sign_up.dart';
import 'package:bytelogiktask/Splash%20Screen/Splash.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(List<String> args) {
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => ProviderScope(
  //       child: bytelogik(),
  //     ),
  //   ),
  // );

  runApp(ProviderScope(child: bytelogik()));
}

class bytelogik extends StatefulWidget {
  const bytelogik({Key? key}) : super(key: key);

  @override
  State<bytelogik> createState() => _bytelogikState();
}

class _bytelogikState extends State<bytelogik> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          // loginpage(),
          // SignUppage(),
          // HomePage(),
          SplashScreen(),
    );
  }
}
