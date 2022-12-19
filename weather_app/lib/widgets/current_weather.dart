import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/utils/theme_styles.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeather({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Temperature Area
        temperatureAreaWidgets(),

        const SizedBox(height: 20.00),
        // Windspeed Area, Humidity and Cloud Speed areas

        currentWeathermoredetailsWidgets(),
      ],
    );
  }

  Widget temperatureAreaWidgets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80.00,
          width: 80.00,
        ),
        Container(
          height: 50.00,
          width: 1.00,
          color: ThemeStyles.dividerLine,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: "${weatherDataCurrent.current.temp!.toInt()}°C",
            style: const TextStyle(
                color: ThemeStyles.textColorBlack,
                fontSize: 64,
                fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: "${weatherDataCurrent.current.weather![0].description}",
            style: const TextStyle(
                color: Color.fromARGB(255, 98, 188, 232),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          )
        ])),
      ],
    );
  }

  Widget currentWeathermoredetailsWidgets() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60.00,
              width: 60.00,
              padding: const EdgeInsets.all(16.00),
              decoration: BoxDecoration(
                color: ThemeStyles.cardColor,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 60.00,
              width: 60.00,
              padding: const EdgeInsets.all(16.00),
              decoration: BoxDecoration(
                color: ThemeStyles.cardColor,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 60.00,
              width: 60.00,
              padding: const EdgeInsets.all(16.00),
              decoration: BoxDecoration(
                color: ThemeStyles.cardColor,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Image.asset("assets/icons/humidity.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 10.00,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20.00,
              width: 60.00,
              child: Text(
                "${weatherDataCurrent.current.windSpeed}km/h",
                style: const TextStyle(fontSize: 12.00),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.00,
              width: 60.00,
              child: Text(
                "${weatherDataCurrent.current.clouds}%",
                style: const TextStyle(fontSize: 12.00),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.00,
              width: 60.00,
              child: Text(
                "${weatherDataCurrent.current.humidity}%",
                style: const TextStyle(fontSize: 12.00),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
