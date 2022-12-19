import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/theme_styles.dart';

class HourlyDetalis extends StatelessWidget {
  final int temp;
  final int index;
  final int cardIndex;
  final int timeStamps;
  final String weatherIcon;

  String getTime(final timeStamps) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamps * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  const HourlyDetalis({
    Key? key,
    required this.temp,
    required this.index,
    required this.cardIndex,
    required this.timeStamps,
    required this.weatherIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.00),
          child: Text(getTime(timeStamps),
              style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : ThemeStyles.textColorBlack,
              )),
        ),
        Container(
          margin: const EdgeInsets.all(5.00),
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40.00,
            width: 40.00,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10.00),
          child: Text("$temp°C",
              style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : ThemeStyles.textColorBlack,
              )),
        ),
      ],
    );
  }
}
