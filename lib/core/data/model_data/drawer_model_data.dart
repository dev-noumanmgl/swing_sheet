import 'package:flutter/material.dart';
import 'package:swing_sheet/core/data/models/drawer_model.dart';

List<DrawerModel> getDrawerData() {
  List<DrawerModel> drawerData = [];

  DrawerModel drawerModel = DrawerModel();
  drawerModel.icon = Icon(Icons.home);
  drawerModel.title = "Home";
  drawerData.add(drawerModel);

  drawerModel = DrawerModel();
  drawerModel.icon = Icon(Icons.calendar_today);
  drawerModel.title = "Calendar";
  drawerData.add(drawerModel);

  drawerModel = DrawerModel();
  drawerModel.icon = Icon(Icons.group);
  drawerModel.title = "Students";
  drawerData.add(drawerModel);

  drawerModel = DrawerModel();
  drawerModel.icon = Icon(Icons.book_online);
  drawerModel.title = "Booking";
  drawerData.add(drawerModel);

  drawerModel = DrawerModel();
  drawerModel.icon = Icon(Icons.account_circle);
  drawerModel.title = "Profile";
  drawerData.add(drawerModel);

  drawerModel = DrawerModel();
  drawerModel.icon = Icon(Icons.location_on);
  drawerModel.title = "Locations";
  drawerData.add(drawerModel);

  drawerModel = DrawerModel();
  drawerModel.icon = Icon(Icons.image);
  drawerModel.title = "Media";
  drawerData.add(drawerModel);

  drawerModel = DrawerModel();
  drawerModel.icon = Icon(Icons.info);
  drawerModel.title = "About Us";
  drawerData.add(drawerModel);

  return drawerData;
}
