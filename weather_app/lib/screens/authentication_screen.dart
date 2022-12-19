import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/theme_styles.dart';
import 'package:weather_app/widgets/widgets/custom_button.dart';
import 'package:weather_app/widgets/widgets/custom_image_picker.dart';
import 'package:weather_app/widgets/widgets/garibook_form_field.dart';
import 'package:weather_app/widgets/widgets/garibook_text_widgets.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isChecked = false;
  bool isPasswordVisible = true;
  bool obscureText = true;
  String password = '';
  bool onPressedButton = true;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: ThemeStyles.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30.00,
                ),
                Row(
                  children: [
                    // signin & Signup Button
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: CustomButton(
                          onTap: () {
                            setState(() {
                              onPressedButton = true;
                            });
                          },
                          buttonColor: onPressedButton
                              ? ThemeStyles.primaryColor
                              : ThemeStyles.whiteColor,
                          textColor: onPressedButton
                              ? ThemeStyles.whiteColor
                              : ThemeStyles.blackColor,
                          borderColor: onPressedButton
                              ? ThemeStyles.blackColor
                              : ThemeStyles.primaryColor,
                          borderRadius: 10.00,
                          buttonText: "Sign In"),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: CustomButton(
                          onTap: () {
                            setState(() {
                              onPressedButton = false;
                            });
                          },
                          buttonColor: onPressedButton
                              ? ThemeStyles.whiteColor
                              : ThemeStyles.primaryColor,
                          textColor: onPressedButton
                              ? ThemeStyles.blackColor
                              : ThemeStyles.whiteColor,
                          borderColor: onPressedButton
                              ? ThemeStyles.primaryColor
                              : ThemeStyles.blackColor,
                          borderRadius: 10.00,
                          buttonText: "Sign Up"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.00,
                ),
                onPressedButton
                    ? Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const GaribookTextWidget(
                                text: 'Email',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8.00,
                          ),
                          GaribookCustomTextFormField(
                            textInputType: TextInputType.emailAddress,
                            hint: 'scribbleriyad@gmail.com'.tr,
                            obscureText: false,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 10.00,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const GaribookTextWidget(
                                text: 'Password',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8.00,
                          ),
                          //Password TextFormField,
                          GaribookCustomTextFormField(
                            hint: '*****'.tr,
                            obscureText: false,
                            maxLines: 1,
                            // controller: password,
                            textInputType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'password_field_cannot_be_empty'.tr;
                              } else if (value.length < 6) {
                                return 'password_field_must_be_atleast_6';
                              }
                              return null;
                            },
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  obscureText == true
                                      ? obscureText = false
                                      : obscureText = true;
                                });
                              },
                              child: Icon(
                                obscureText
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50.00,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomButton(
                              onTap: () async {
                                Navigator.pushNamed(
                                    context, Constants.weatherScreenRoute);
                              },
                              buttonColor: ThemeStyles.primaryColor,
                              textColor: ThemeStyles.whiteColor,
                              borderColor: ThemeStyles.blackColor,
                              borderRadius: 10.00,
                              buttonText: "Continue",
                            ),
                          ),
                        ],
                      )
                    : const RegistrationScreen(),
              ],
            ),
          ),
        ),
      ));
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isCheckedConditions = false;

  bool isPasswordVisible = false;

  String password = '';

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return ThemeStyles.primaryColor;
    }
    return ThemeStyles.primaryColor;
  }

  @override
  Widget build(BuildContext context) => Column(children: [
        const SizedBox(
          height: 10.00,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: const GaribookTextWidget(
              text: 'Full Name', fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 8.00,
        ),
        GaribookCustomTextFormField(
          textInputType: TextInputType.name,
          hint: 'Full Name'.tr,
          obscureText: false,
          maxLines: 1,
        ),
        const SizedBox(
          height: 10.00,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: const GaribookTextWidget(
              text: 'Email', fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 8.00,
        ),
        GaribookCustomTextFormField(
          textInputType: TextInputType.phone,
          hint: 'scribbleriyad@gmail.com'.tr,
          obscureText: false,
          maxLines: 1,
        ),
        const SizedBox(
          height: 10.00,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: const GaribookTextWidget(
              text: 'Password', fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 8.00,
        ),
        GaribookCustomTextFormField(
          textInputType: TextInputType.emailAddress,
          hint: '********'.tr,
          obscureText: isPasswordVisible,
          maxLines: 1,
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: () =>
                setState(() => isPasswordVisible = !isPasswordVisible),
          ),
        ),
        const SizedBox(
          height: 10.00,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: const GaribookTextWidget(
              text: 'Confirm Password',
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        const SizedBox(
          height: 8.00,
        ),
        GaribookCustomTextFormField(
          textInputType: TextInputType.visiblePassword,
          hint: '********'.tr,
          obscureText: isPasswordVisible,
          maxLines: 1,
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: () =>
                setState(() => isPasswordVisible = !isPasswordVisible),
          ),
        ),
        const SizedBox(
          height: 20.00,
        ),
        Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: GaribookTextWidget(
                  text: "Upload Profile Picture",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15.00),
            CustomImagePicker(
              height: 200.00,
              width: MediaQuery.of(context).size.width * .9,
            ),
            const SizedBox(
              height: 40.00,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  onTap: () async {
                    Navigator.pushNamed(context, Constants.weatherScreenRoute);
                  },
                  buttonColor: ThemeStyles.primaryColor,
                  textColor: ThemeStyles.whiteColor,
                  borderColor: ThemeStyles.blackColor,
                  borderRadius: 10.00,
                  buttonText: "Continue",
                ),
              ),
            )
          ],
        ),
      ]);
}
