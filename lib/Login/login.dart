import 'package:bytelogiktask/Home/Home_page.dart';
import 'package:bytelogiktask/Login/Controller/Login_controller.dart';
import 'package:bytelogiktask/Signup/Sign_up.dart';
import 'package:bytelogiktask/Sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final Logininput = Logincontroller();
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   Logininput.loginApi(context);
  // }

  @override
  Widget build(BuildContext context) {
    setScreenSize(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Center(
                    child: Container(
                      height: 90,
                      width: 260,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                shbox30,
                Column(
                  children: [
                    Container(
                      width: 280,
                      child: TextFormField(
                        controller: Logininput.userid,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: GoogleFonts.inter(
                              color: Color(0xFFFAB400),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 40,
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Color(0xFFFAB400),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    shbox20,
                    Container(
                      width: 280,
                      child: TextFormField(
                        controller: Logininput.passw,
                        maxLength: 8,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: GoogleFonts.inter(
                              color: Color(0xFFFAB400),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 40,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: Color(0xFFFAB400),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFF000000),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    shbox40,
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFAB400),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 10,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 110, vertical: 18),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await Logininput.loginApi(context);
                          }
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF000000)),
                        ),
                      ),
                    ),
                    shbox30,
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Don't have an account ? ",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Color(0xFF000000))),
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => SignUppage()),
                                    );
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: GoogleFonts.inter(
                                      fontSize: 17,
                                      color: Color(0xFFFAB400),
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
