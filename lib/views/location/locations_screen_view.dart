import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';
import 'package:swing_sheet/widgets/logout_widget.dart';

class LocationsScreenView extends StatelessWidget {
  const LocationsScreenView({super.key});

  Widget buildDetailContainer(
    String title,
    String value,
    IconData icon,
    BuildContext context,
    String date,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: AppColors.black, size: 28),
                  SizedBox(width: screenWidth * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: textStyleBold(AppColors.black)),
                        SizedBox(height: screenHeight * 0.01),
                        Text(date, style: textStyleLight(AppColors.black)),
                        SizedBox(height: screenHeight * 0.01),
                        Text(value, style: textStyleRegular()),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.directions_rounded,
                              color: AppColors.green,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.black,
        title: Image.asset(
          "assets/images/appBanner.png",
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        centerTitle: true,
        actions: [
          LogoutWidget(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  buildDetailContainer("Golf Course", "1234 Main Street",
                      Icons.location_on, context, formattedDate),
                  buildDetailContainer("Tennis Course", "5678 Park Avenue",
                      Icons.location_on, context, formattedDate),
                  buildDetailContainer("Tennis Course", "9101 Elm Street",
                      Icons.location_on, context, formattedDate),
                  buildDetailContainer("Golf Course", "1123 Oak Boulevard",
                      Icons.location_on, context, formattedDate),
                  buildDetailContainer("Golf Course", "5678 Park Avenue",
                      Icons.location_on, context, formattedDate),
                  buildDetailContainer("Tennis Course", "9101 Elm Street",
                      Icons.location_on, context, formattedDate),
                  buildDetailContainer("Tennis Course", "1123 Oak Boulevard",
                      Icons.location_on, context, formattedDate),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
          ],
        ),
      ),
    );
  }
}
