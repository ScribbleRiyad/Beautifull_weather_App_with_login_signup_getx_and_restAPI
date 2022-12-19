import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/utils/theme_styles.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 1.00,
            left: 20.00,
            right: 20.00,
            bottom: 20.00,
          ),
          child: const Text(
            " Comfort Level",
            style: TextStyle(
                fontSize: 18.00,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
        ),
        SizedBox(
          height: 180.00,
          child: Column(
            children: [
              Center(
                  child: SleekCircularSlider(
                min: 0.0,
                max: 100.00,
                initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                        handlerSize: 5.0,
                        trackWidth: 10.00,
                        progressBarWidth: 12.00),
                    animationEnabled: true,
                    size: 140.00,
                    infoProperties: InfoProperties(
                        bottomLabelText: 'Humidity',
                        bottomLabelStyle: const TextStyle(
                            letterSpacing: 0.1, fontSize: 14.00, height: 1.5)),
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor:
                            ThemeStyles.firstGradientColor.withAlpha(150),
                        progressBarColors: [
                          ThemeStyles.firstGradientColor,
                          ThemeStyles.secondGradientColor,
                        ])),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Feels Like  ",
                        style: TextStyle(
                            color: ThemeStyles.textColorBlack,
                            fontSize: 10,
                            height: 0.8,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: "${weatherDataCurrent.current.feelsLike}",
                        style: const TextStyle(
                            color: ThemeStyles.textColorBlack,
                            fontSize: 10,
                            height: 0.8,
                            fontWeight: FontWeight.w500)),
                  ])),
                  Container(
                    height: 25.00,
                    width: 1.00,
                    margin: const EdgeInsets.only(
                      left: 40.00,
                      right: 40.00,
                    ),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: " Uv Index  ",
                        style: TextStyle(
                            color: ThemeStyles.textColorBlack,
                            fontSize: 10,
                            height: 0.8,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: "${weatherDataCurrent.current.uvi}",
                        style: const TextStyle(
                            color: ThemeStyles.textColorBlack,
                            fontSize: 10,
                            height: 0.8,
                            fontWeight: FontWeight.w500)),
                  ])),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
