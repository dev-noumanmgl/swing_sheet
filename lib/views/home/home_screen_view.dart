import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/data/model_data/home_container_model_data.dart';
import 'package:swing_sheet/core/data/models/home_container_model.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';
import 'package:swing_sheet/views/dashBoard/dashBoardNavigationBar.dart';
import 'package:swing_sheet/views/location/locations_screen_view.dart';
import 'package:swing_sheet/views/media_content/media_content_screen_view.dart';
import 'package:swing_sheet/widgets/logout_widget.dart';

class HomeScreenView extends StatefulWidget {
  final bool isInstructor;
  const HomeScreenView({super.key, required this.isInstructor});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  late List<HomeContainerModel> homeContainerModelData;

  @override
  void initState() {
    super.initState();
    homeContainerModelData = widget.isInstructor
        ? getInstructorHomeContainerModelData(context)
        : getStudentHomeContainerModelData(context);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        foregroundColor: AppColors.black,
        title: Image.asset(
          "assets/images/appBanner.png",
          width: screenWidth * 0.5,
        ),
        centerTitle: true,
        actions: [
          LogoutWidget(),
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // Disable grid scrolling
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth > 600 ? 4 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: homeContainerModelData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        index == 4
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LocationsScreenView()),
                              )
                            : index == 5
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MediaContentScreenView()),
                                  )
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DashBoardNavigationBar(index: index),
                                    ),
                                  );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: AppColors.red.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                homeContainerModelData[index].iconData!,
                                color: AppColors.red,
                                size: screenWidth * 0.1,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              homeContainerModelData[index].title!,
                              style: textStyleH3(AppColors.black),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: textStyleBold(AppColors.red),
                    children: [
                      TextSpan(text: "Ryan J Reese | "),
                      TextSpan(
                        text: "ryan.reese@factivetech.com",
                        style: textStyleBold(AppColors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
