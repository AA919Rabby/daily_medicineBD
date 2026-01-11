import 'package:daily_medicinebd/schreens/home_schreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashDetails extends StatefulWidget {
  const SplashDetails({super.key});

  @override
  State<SplashDetails> createState() => _SplashDetailsState();
}

class _SplashDetailsState extends State<SplashDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/only.png',
                      height: 400,
                      width: Get.width,
                    ),
                    const SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '100 Genetic names of\nmedicine with diseases',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontStyle: FontStyle.italic),
                          ),
                          TextButton(
                            onPressed: () async {

                              var storage = await SharedPreferences.getInstance();

                              await storage.setBool('isVisited', true);

                              Get.offAll(() => const HomeSchreen());
                            },
                            child: Text(
                              'Next >',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.8),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
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