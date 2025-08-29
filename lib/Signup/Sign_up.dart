import 'package:bytelogiktask/Login/login.dart';
import 'package:bytelogiktask/Signup/Controller/Signup_controller.dart';
import 'package:bytelogiktask/Sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUppage extends StatefulWidget {
  const SignUppage({Key? key}) : super(key: key);

  @override
  State<SignUppage> createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final Signupinput = SignupController();
  @override
  Widget build(BuildContext context) {
    setScreenSize(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90,
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
                  padding: const EdgeInsets.only(top: 8, left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Create an account",
                        style: GoogleFonts.inter(
                          fontSize: 20,
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
                        controller: Signupinput.name,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: GoogleFonts.inter(
                              color: Color(0xFFFAB400),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 40,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFFFAB400),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                    shbox20,
                    Container(
                      width: 280,
                      child: TextFormField(
                        controller: Signupinput.emailid,
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
                        maxLength: 8,
                        keyboardType: TextInputType.emailAddress,
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
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    shbox20,
                    Container(
                      width: 280,
                      child: TextFormField(
                        maxLength: 8,
                        controller: Signupinput.password,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != Signupinput.password.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
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
                            await Signupinput.SignupApi(context);
                          }
                        },
                        child: Text(
                          "SIGN UP",
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
                                  text: "Already have an account ? ",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Color(0xFF000000))),
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => loginpage()),
                                    );
                                  },
                                  child: Text(
                                    "Login Up",
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
