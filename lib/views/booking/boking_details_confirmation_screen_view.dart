import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';
import 'package:swing_sheet/widgets/commonOutlinedButton.dart';

class BookingDetailsConfirmationScreenView extends StatelessWidget {
  final String instructorName;
  final DateTime bookingDate;
  final String slotTiming;
  final String location;

  const BookingDetailsConfirmationScreenView({
    super.key,
    required this.instructorName,
    required this.bookingDate,
    required this.slotTiming,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.black,
        title: Image.asset(
          "assets/images/appBanner.png",
          width: screenWidth * 0.5,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: AppColors.black,
            ),
          )
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
                  buildDetailContainer(
                    "Instructor:",
                    instructorName,
                    Icons.person,
                    context,
                  ),
                  buildDetailContainer(
                    "Booking Date:",
                    "${_getMonthName(bookingDate.month)} ${bookingDate.day}, ${bookingDate.year}",
                    Icons.calendar_today,
                    context,
                  ),
                  buildDetailContainer(
                    "Slot Duration:",
                    "30 minutes",
                    Icons.timelapse,
                    context,
                  ),
                  buildDetailContainer(
                    "Slot Timing:",
                    slotTiming,
                    Icons.schedule,
                    context,
                  ),
                  buildDetailContainer(
                    "Location:",
                    location,
                    Icons.location_on,
                    context,
                    isLocation: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            InkWell(
              child: commonOutlinedButton(
                context: context,
                label: "Submit",
                color: AppColors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
          ],
        ),
      ),
    );
  }

  Widget buildDetailContainer(
    String title,
    String value,
    IconData icon,
    BuildContext context, {
    bool isLocation = false,
  }) {
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
                        Text(value, style: textStyleRegular()),
                        isLocation
                            ? Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.directions_rounded,
                                    color: AppColors.green,
                                    size: 30,
                                  ),
                                ),
                              )
                            : SizedBox(),
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

  String _getMonthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month - 1];
  }
}
