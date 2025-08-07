import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';

Widget chooseProfileImagesBottomSheet(context) {
  return Container(
    padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8, top: 24),
    height: 160,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Choose Image",
              style: textStyleH3(AppColors.white),
            ),
            const Icon(
              Icons.cancel,
              size: 28,
            )
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                InkWell(
                    onTap: () => Navigator.of(context).pop("camera"),
                    child: circleAvatarIconView(Icons.camera_alt)),
                const SizedBox(height: 15),
                const Text("Camera")
              ],
            ),
            const SizedBox(width: 50),
            Column(
              children: [
                InkWell(
                    onTap: () => Navigator.of(context).pop("gallery"),
                    child:
                        circleAvatarIconView(CupertinoIcons.graph_square_fill)),
                const SizedBox(height: 15),
                const Text("Gallery")
              ],
            ),
          ],
        )
      ],
    ),
  );
}

circleAvatarIconView(IconData icon) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        border: Border.all(color: Colors.black.withOpacity(.6))),
    child: CircleAvatar(
      backgroundColor: AppColors.white,
      child: Icon(icon, color: Colors.black.withOpacity(.6)),
    ),
  );
}
