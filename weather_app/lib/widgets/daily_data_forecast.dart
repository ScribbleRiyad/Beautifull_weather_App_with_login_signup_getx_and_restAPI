import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_data_daily.dart';
import 'package:weather_app/utils/theme_styles.dart';

class DailyForecastWidget extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyForecastWidget({super.key, required this.weatherDataDaily});

  // Date String Manupulations
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat("E").format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.00,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ThemeStyles.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(
              bottom: 10.00,
            ),
            child: const Text(
              "Next Days",
              style:
                  TextStyle(color: ThemeStyles.textColorBlack, fontSize: 17.00),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300.00,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weatherDataDaily.daily.length > 7
              ? 7
              : weatherDataDaily.daily.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60.00,
                  padding: const EdgeInsets.only(left: 10.00, right: 10.00),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 80.00,
                          child: Text(
                            getDay(weatherDataDaily.daily[index].dt),
                            style: const TextStyle(
                                color: ThemeStyles.textColorBlack,
                                fontSize: 13.00),
                          )),
                      SizedBox(
                        height: 30.00,
                        width: 30.00,
                        child: Image.asset(
                            "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                      ),
                      Text(
                          "${weatherDataDaily.daily[index].temp!.max}°C/${weatherDataDaily.daily[index].temp!.min}°C")
                    ],
                  ),
                ),
                Container(
                  height: 1.00,
                  color: ThemeStyles.dividerLine,
                )
              ],
            );
          }),
    );
  }
}
