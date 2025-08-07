import 'package:flutter/material.dart';
import 'package:swing_sheet/core/data/models/home_container_model.dart';

List<HomeContainerModel> getInstructorHomeContainerModelData(context) {
  return [
    HomeContainerModel(
      iconData: Icons.calendar_today,
      title: "Calendar",
    ),
    HomeContainerModel(
      iconData: Icons.school,
      title: "Instructors",
    ),
    HomeContainerModel(
      iconData: Icons.event_available,
      title: "Booking",
    ),
    HomeContainerModel(
      iconData: Icons.person,
      title: "Profile",
    ),
    HomeContainerModel(
      iconData: Icons.location_on,
      title: "Location",
    ),
    HomeContainerModel(
      iconData: Icons.perm_media,
      title: "Media",
    ),
  ];
}

List<HomeContainerModel> getStudentHomeContainerModelData(context) {
  return [
    HomeContainerModel(
      iconData: Icons.calendar_today,
      title: "Calendar",
    ),
    HomeContainerModel(
      iconData: Icons.group,
      title: "Students",
    ),
    HomeContainerModel(
      iconData: Icons.event_available,
      title: "Booking",
    ),
    HomeContainerModel(
      iconData: Icons.person,
      title: "Profile",
    ),
    HomeContainerModel(
      iconData: Icons.location_on,
      title: "Location",
    ),
    HomeContainerModel(
      iconData: Icons.perm_media,
      title: "Media",
    ),
  ];
}
