import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/data/models/drawer_model.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';
import 'package:swing_sheet/views/about__us/about_us_screen_view.dart';
import 'package:swing_sheet/views/dashBoard/dashBoardNavigationBar.dart';
import 'package:swing_sheet/views/home/home_screen_view.dart';
import 'package:swing_sheet/views/location/locations_screen_view.dart';
import 'package:swing_sheet/views/media_content/media_content_screen_view.dart';

void navigateToPage(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreenView(
                  isInstructor: false,
                )),
      );
      break;
    case 1:
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DashBoardNavigationBar(
                  index: 0,
                )),
      );
      break;
    case 2:
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DashBoardNavigationBar(index: 1)),
      );
      break;
    case 3:
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DashBoardNavigationBar(index: 2)),
      );
      break;
    case 4:
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DashBoardNavigationBar(index: 3)),
      );
      break;
    case 5:
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LocationsScreenView()),
      );
      break;
    case 6:
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MediaContentScreenView()),
      );
      break;
    case 7:
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutUsScreenView()),
      );
      break;
    default:
      break;
  }
}

Widget drawerView(BuildContext context, List<DrawerModel> newDrawerData) {
  return Drawer(
    backgroundColor: AppColors.white,
    shape: Border.all(style: BorderStyle.none),
    child: Column(
      children: [
        Container(
          color: AppColors.red.withOpacity(.4),
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          child: Center(
            child: Image.asset(
              "assets/images/appBanner.png",
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ),
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: newDrawerData.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => navigateToPage(context, index),
                leading: newDrawerData[index].icon,
                iconColor: Colors.black,
                title: Text(
                  newDrawerData[index].title,
                  style: textStyleBold(AppColors.black),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
