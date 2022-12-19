import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/screens/authentication_screen.dart';
import 'package:weather_app/utils/theme_styles.dart';
import 'package:weather_app/widgets/comfort_level.dart';
import 'package:weather_app/widgets/current_weather.dart';
import 'package:weather_app/widgets/daily_data_forecast.dart';
import 'package:weather_app/widgets/header_widget.dart';
import 'package:weather_app/widgets/hourly_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Obx(
      (() => globalController.checkloading().isTrue
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/clouds.png",
                    height: 200.00,
                    width: 200.00,
                  ),
                  const CircularProgressIndicator(),
                ],
              ),
            )
          : const AuthenticationScreen()),
    )));
  }
}
