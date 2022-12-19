import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';

import 'package:weather_app/utils/theme_styles.dart';
import 'package:weather_app/widgets/comfort_level.dart';
import 'package:weather_app/widgets/current_weather.dart';
import 'package:weather_app/widgets/daily_data_forecast.dart';
import 'package:weather_app/widgets/header_widget.dart';
import 'package:weather_app/widgets/hourly_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 20.00,
            ),
            // Header File Include Laction And Time and Date .
            const HeaderWidget(),

            // current temperature Include file

            CurrentWeather(
                weatherDataCurrent:
                    globalController.getData().getCurrentWeather()),

            const SizedBox(
              height: 20.00,
            ),

            // Hourly Wether Temperature Section

            HourlyWidgets(
                weatherDataHourly:
                    globalController.getData().getHourlyWeather()),
            DailyForecastWidget(
                weatherDataDaily: globalController.getData().getDailyWeather()),
            Container(
              height: 1.00,
              color: ThemeStyles.dividerLine,
            ),
            const SizedBox(
              height: 20.00,
            ),
            ComfortLevel(
                weatherDataCurrent:
                    globalController.getData().getCurrentWeather())
          ],
        ),
      )),
    );
  }
}
