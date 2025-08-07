import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/data/models/bottom_navigation_model.dart';
import 'package:swing_sheet/views/dashBoard/pages/bookingScreenView.dart';
import 'package:swing_sheet/views/dashBoard/pages/calendarScreenView.dart';
import 'package:swing_sheet/views/dashBoard/pages/profileScreenView.dart';
import 'package:swing_sheet/views/dashBoard/pages/studentScreenView.dart';

List<BottomNavigationModel> getBottomNavigationModelData(context) {
  List<BottomNavigationModel> bottomNavigationModelList = [];

  bottomNavigationModelList.add(
    BottomNavigationModel(
      title: "Calendar",
      launchPage: const CalendarScreenView(),
      icon: Icons.calendar_month_rounded,
      alternateIcon: Icons.calendar_month_outlined,
      color: AppColors.red,
    ),
  );
  bottomNavigationModelList.add(
    BottomNavigationModel(
      title: "Students",
      launchPage: const StudentScreenView(),
      icon: CupertinoIcons.person_3_fill,
      alternateIcon: CupertinoIcons.person_3,
      color: AppColors.red,
    ),
  );
  bottomNavigationModelList.add(
    BottomNavigationModel(
      title: "Booking",
      launchPage: BookingScreenView(),
      icon: Icons.my_library_books_rounded,
      alternateIcon: Icons.my_library_books_outlined,
      color: AppColors.red,
    ),
  );
  bottomNavigationModelList.add(
    BottomNavigationModel(
      title: "Profile",
      launchPage: const ProfileScreenView(),
      icon: Icons.person_2_sharp,
      alternateIcon: Icons.person_2_outlined,
      color: AppColors.red,
    ),
  );

  return bottomNavigationModelList;
}
