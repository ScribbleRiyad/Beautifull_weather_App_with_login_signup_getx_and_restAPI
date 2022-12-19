import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:weather_app/utils/theme_styles.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.text1,
    required this.text2,
    required this.borderColor,
    this.ontap,
  }) : super(key: key);

  final String text1;
  final String text2;
  final Color borderColor;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.00, right: 20.00),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 100,
          width: 400,
          decoration: BoxDecoration(
            color: ThemeStyles.primaryColor,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0)),
            border: Border.all(
              color: borderColor,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.00, top: 15.00, bottom: 5.00),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: FaIcon(
                          FontAwesomeIcons.planeUp,
                          size: 15.00,
                          color: ThemeStyles.primaryTextColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          text1.tr,
                          style: const TextStyle(
                              color: ThemeStyles.primaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.00, top: 5.00, bottom: 15.00),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: FaIcon(
                          FontAwesomeIcons.locationPin,
                          size: 15.00,
                          color: ThemeStyles.primaryTextColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          text2.tr,
                          style: const TextStyle(
                              color: ThemeStyles.primaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
