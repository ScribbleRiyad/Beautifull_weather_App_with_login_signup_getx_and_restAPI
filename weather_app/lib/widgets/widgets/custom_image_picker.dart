import 'package:flutter/material.dart';
import 'package:weather_app/utils/theme_styles.dart';
import 'package:weather_app/widgets/widgets/file_picker_bottom_sheet.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker(
      {super.key, this.height, this.width, this.color, this.borderColor});
  final double? height;
  final double? width;
  final Color? color;
  final Color? borderColor;

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  var ImageFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color ?? ThemeStyles.whiteColor,
          border:
              Border.all(color: widget.borderColor ?? ThemeStyles.whiteColor)),
      child: GestureDetector(
          onTap: () async {
            ImageFile = await showModalBottomSheet(
              context: context,
              builder: (context) => FilePicker(),
            );
            setState(() {});
          },
          child: Container(
              decoration: BoxDecoration(
                  color: ThemeStyles.whiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ImageFile == null
                  ? Image.asset('assets/splash_screen/Vector.png')
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          ImageFile,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          right: -8,
                          top: -10,
                          child: IconButton(
                            icon: const Icon(
                              Icons.cancel_rounded,
                              color: Colors.red,
                            ),
                            onPressed: (() {
                              setState(() {
                                ImageFile = null;
                              });
                            }),
                          ),
                        )
                      ],
                    ))),
    );
  }
}
