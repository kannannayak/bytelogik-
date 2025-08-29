import 'dart:convert';
import 'package:bytelogiktask/Home/Home_page.dart';

import 'package:bytelogiktask/Login/login.dart';
import 'package:bytelogiktask/Signup/Model/Signup_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class SignupController extends ChangeNotifier {
  final TextEditingController name = TextEditingController();
  final TextEditingController emailid = TextEditingController();
  final TextEditingController password = TextEditingController();
    final TextEditingController confirmPassword = TextEditingController();

  Future<void> SignupApi(BuildContext context) async {
    var apiUrl = "https://traitsolutions.in/byte/signup.php";

    try {
      var requestData = {
        "name": name.text,
        "email": emailid.text,
        "password": password.text
      };
      print("okokookokokookokookookokokokokokokokok${requestData}");

      var responseData =
          await http.post(Uri.parse(apiUrl), body: jsonEncode(requestData));

      print("NNNNNNJDNDNJD${responseData.body}");
      if (responseData.statusCode == 200) {
        final response = jsonDecode(responseData.body);
        print(responseData.statusCode);

        var loginData = SignupModel.fromJson(response);
        print(loginData.message);

        if (loginData.status == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                loginData.message.toString(),
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color(0xFFFAB400),
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
            ),
          );

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => loginpage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                loginData.message.toString(),
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color(0xFFFAB400),
            ),
          );
          print("enter6");
          print(loginData.message);
        }
      }
    } on http.ClientException catch (e) {
      print("Network error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please check your internet connection.",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFFFAB400),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
