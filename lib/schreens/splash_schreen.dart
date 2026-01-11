import 'dart:async';
import 'package:daily_medicinebd/schreens/home_schreen.dart';
import 'package:daily_medicinebd/schreens/splash_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashSchreen extends StatefulWidget {
  const SplashSchreen({super.key});

  @override
  State<SplashSchreen> createState() => _SplashSchreenState();
}

class _SplashSchreenState extends State<SplashSchreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      checkUser();
    });
  }

  void checkUser() async {
    var storage = await SharedPreferences.getInstance();

    var status = storage.getBool('isVisited');

    if (status == true) {
      Get.offAll(() => const HomeSchreen());
    } else {
      Get.offAll(() => const SplashDetails());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Column(
                  children: [
                    Icon(Icons.medical_information_rounded, color: Colors.white70, size: 45),
                    Text(
                      'Daily Medicine BD',
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: 230),
                    CircularProgressIndicator(color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}