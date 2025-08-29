import 'package:bytelogiktask/Sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Controller/Coute_state.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String userName = "";
  String userDate = "";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString("user_name") ?? "";
      userDate = prefs.getString("user_date") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    setScreenSize(context);

    final counterState = ref.watch(counterProvider);
    setScreenSize(context);
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: screenHeight * 0.1,
      //   backgroundColor: Color(0xFFFAB400),
      //   centerTitle: true,
      //   title: Text(
      //     "Bills Due",
      //     style: TextStyle(fontFamily: "JaldiBold", color: Color(0xFF000000)),
      //     // style:TextStyle(color: Patent_secondory,fontFamily: )
      //   ),
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //           bottomLeft: Radius.circular(30),
      //           bottomRight: Radius.circular(30))),
      //   // leading: IconButton(
      //   //   // icon:
      //   //   //     Image.asset("assets/images/Arrows.png", scale: screenWidth * 0.08,
      //   //   //   height: screenWidth * 0.08,
      //   //   //   fit: BoxFit.contain), // Add your image path

      //   // ),
      // ),

      appBar: AppBar(
        toolbarHeight: screenHeight * 0.1,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFAB400),
                // Color.fromRGBO(255, 219, 127, 1),
                Color(0xFFFAB400),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Home",
          style: GoogleFonts.inter(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 248, 250, 250),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Column(
        children: [
          shbox30,
          Center(
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
          shbox10,
          Center(
              child: Column(
            children: [
              Text(
                "Welcome",
                style: GoogleFonts.inter(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFAB400)),
              ),
              Text(
                userName,
                style: GoogleFonts.inter(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFAB400)),
              ),
            ],
          )),
          shbox30,
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 7, 3, 219),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 10,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 18),
                    ),
                    onPressed: () {
                      ref.read(counterProvider.notifier).increment();
                    },
                    child: Text(
                      "Increment",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 218, 3, 3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 10,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 18),
                    ),
                    onPressed: () {
                      ref.read(counterProvider.notifier).decrement();
                    },
                    child: Text(
                      "Decrement",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 77, 228, 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 10,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 18),
                    ),
                    onPressed: () {
                      ref.read(counterProvider.notifier).reset();
                    },
                    child: Text(
                      "Reset",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          shbox70,
          Center(
            child: Text(
              "${counterState.count}",
              style: GoogleFonts.jaldi(
                fontSize: 100,
                color: Color.fromARGB(255, 170, 209, 29),
              ),
            ),
          ),
          shbox15,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Account active date : ${formatDateOnly(userDate)}",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF000000),
                ),
              ),
            ],
          ),
          shbox10,
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       "Account active time : ${formatTimeOnly(userDate)}",
          //       style: GoogleFonts.inter(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 15,
          //         color: Color(0xFF000000),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  String formatDateOnly(String date) {
    try {
      DateTime parsedDate =
          DateTime.tryParse(date) ?? DateFormat("dd-MM-yyyy").parse(date);

      int day = parsedDate.day;
      String suffix = "th";
      if (day == 1 || day == 21 || day == 31) {
        suffix = "st";
      } else if (day == 2 || day == 22) {
        suffix = "nd";
      } else if (day == 3 || day == 23) {
        suffix = "rd";
      }

      String monthYear = DateFormat('MMMM yyyy').format(parsedDate);
      return "$day$suffix $monthYear";
    } catch (e) {
      return "Invalid date";
    }
  }

  String formatTimeOnly(String date) {
    try {
      DateTime parsedDate =
          DateTime.tryParse(date) ?? DateFormat("dd-MM-yyyy HH:mm").parse(date);
      return DateFormat('hh:mm a').format(parsedDate);
    } catch (e) {
      return "Invalid time";
    }
  }
}
