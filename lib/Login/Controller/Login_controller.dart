import 'dart:convert';
import 'package:bytelogiktask/Home/Home_page.dart';
import 'package:bytelogiktask/Login/Model/Login_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Logincontroller extends ChangeNotifier {
  final TextEditingController userid = TextEditingController();
  final TextEditingController passw = TextEditingController();

  Future<void> loginApi(BuildContext context) async {
    var apiUrl = "https://traitsolutions.in/byte/login.php";

    try {
      var requestData = {"email": userid.text, "password": passw.text};
      print("okokookokokookokookookokokokokokokokok${requestData}");

      var responseData =
          await http.post(Uri.parse(apiUrl), body: jsonEncode(requestData));

      print("NNNNNNJDNDNJD${responseData.body}");
      if (responseData.statusCode == 200) {
        final response = jsonDecode(responseData.body);
        print(responseData.statusCode);

        var loginData = LoginModel.fromJson(response);
        print(loginData.message);

        if (loginData.status == true) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("user_email", userid.text);
          await prefs.setString("user_password", passw.text);
          await prefs.setString("user_name", loginData.user!.name.toString());
          await prefs.setString(
              "user_date", loginData.user!.createdAt.toString());
          print("name value pass : ${loginData.user!.name.toString()}");
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
            MaterialPageRoute(builder: (context) => HomePage()),
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
