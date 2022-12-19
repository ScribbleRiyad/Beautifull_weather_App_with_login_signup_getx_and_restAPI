import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/utils/theme_styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    this.cardHeight,
    this.cardBackgroundColor,
    this.circleAvataColor,
    this.text1,
    this.text2,
    this.arrowheight,
    this.arrowWidth,
    required this.borderColor,
    this.textFontSize,
    this.ontap,
    Key? key,
  }) : super(key: key);
  final double? cardHeight;
  final Color? cardBackgroundColor;
  final Color borderColor;
  final Color? circleAvataColor;
  final double? arrowheight;
  final double? arrowWidth;
  final double? textFontSize;
  final String? text1;
  final String? text2;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.00, right: 20.00, top: 5, bottom: 5.00),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardBackgroundColor,
            border: Border.all(
              color: borderColor,
            )),
        height: cardHeight,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: circleAvataColor,
                child: const Center(child: FaIcon(FontAwesomeIcons.car)),
              ),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: text1,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: textFontSize,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: text2,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: textFontSize,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: ontap,
                child: Container(
                  height: arrowheight,
                  width: arrowWidth,
                  decoration: BoxDecoration(
                      color: ThemeStyles.blackColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.arrowRight,
                      color: ThemeStyles.primaryTextColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
