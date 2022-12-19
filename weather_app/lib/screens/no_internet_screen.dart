import 'package:flutter/material.dart';

import 'package:weather_app/utils/theme_styles.dart';
import 'package:weather_app/widgets/widgets/garibook_text_widgets.dart';

class NoInterNetScreen extends StatelessWidget {
  const NoInterNetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ThemeStyles.blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 40,
            ),
            GaribookTextWidget(
              text: 'Check your internet connection...',
              fontSize: 18,
              color: ThemeStyles.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    ));
  }
}
