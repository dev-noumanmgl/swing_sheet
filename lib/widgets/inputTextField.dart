import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';

Widget inputTextField(
    context, IconData icon, String hintText, currentController) {
  return Container(
    height: 48,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: AppColors.black.withOpacity(.9),
      ),
    ),
    child: TextFormField(
      controller: currentController,
      style: TextStyle(color: Colors.black.withOpacity(.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: AppColors.black.withOpacity(.7),
        ),
        border: InputBorder.none,
        hintMaxLines: 1,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: AppColors.black.withOpacity(.5),
        ),
      ),
    ),
  );
}
