import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weather_app/utils/theme_styles.dart';

import 'garibook_text_widgets.dart';

class FilePicker extends StatelessWidget {
  File? file;

  FilePicker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: const GaribookTextWidget(
              text: 'Select_Source',
              //style: bb_text_style_24_bold_black,

              fontSize: 22, color: ThemeStyles.primaryColor,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _bottomSheetOptions(
                    context: context,
                    label: 'CAMERA',
                    icon: FontAwesomeIcons.camera,
                    onClicked: () => _selectedItem(context, 0)),
                _bottomSheetOptions(
                    context: context,
                    label: 'Gallery',
                    icon: FontAwesomeIcons.image,
                    onClicked: () => _selectedItem(context, 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _selectedItem(BuildContext context, int index) async {
    switch (index) {
      case 0:
        await _openCamera(context);
        Navigator.pop(context, file);
        break;
      case 1:
        await _openGallery(context);
        Navigator.pop(context, file);
        break;
    }
  }

  _openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
        maxHeight: 1024,
        maxWidth: 1024);
    file = File(pickedFile!.path);
    // imageFileupload= pickedFile;
    //String filepath = pickedFile!.path;
    //_cropImage(filepath);

    return file;

    // setState(() {
    //   if (type == 'chalan') {
    //     imageFile = file;
    //   } else {
    //     imageInvoiceFile = file;
    //   }
    // });
  }

  _openCamera(BuildContext context) async {
    final picker = ImagePicker();
    // final _cropper = ImageCropper();
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 25,
        maxHeight: 1024,
        maxWidth: 1024,
        preferredCameraDevice: CameraDevice.rear);
    file = File(pickedFile!.path);

    return file;

    // setState(() {
    //   if (type == 'chalan') {
    //    return imageFile = file;
    //   } else {
    //     imageInvoiceFile = file;
    //   }
    // });
    // Navigator.of(context).pop();
  }
}

Widget _bottomSheetOptions({
  required BuildContext context,
  required String? label,
  required IconData? icon,
  VoidCallback? onClicked,
}) {
  return SizedBox(
    width: 120,
    height: 120,
    child: GestureDetector(
      onTap: onClicked,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: ThemeStyles.primaryColor,
            size: 30,
            // width: 50,
            // height: 50,
          ),
          GaribookTextWidget(
            text: label!,
            //   // style: TextThemeStyles.generalTextStyle(
            //   //     context: context,
            //   //     color: ThemeStyle.blackColor,
            //   //     fontSize: 14.0,
            //   //     fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
