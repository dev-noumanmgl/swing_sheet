import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';

class RescheduleBookingDetailsScreenView extends StatelessWidget {
  final String instructorName;
  final DateTime bookingDate;
  final String slotTiming;
  final String location;

  const RescheduleBookingDetailsScreenView({
    super.key,
    required this.instructorName,
    required this.bookingDate,
    required this.slotTiming,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM yyyy').format(bookingDate);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.black,
        title: Image.asset(
          "assets/images/appBanner.png",
          width: 200,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  buildDetailContainer(
                    "Instructor:",
                    instructorName,
                    Icons.person,
                  ),
                  buildDetailContainer(
                    "Booking Date:",
                    formattedDate,
                    Icons.calendar_today,
                  ),
                  buildDetailContainer(
                    "Slot Duration:",
                    "30 minutes",
                    Icons.timelapse,
                  ),
                  buildSlotTimingContainer(
                    "Slot Timing:",
                    slotTiming,
                  ),
                  buildDetailContainer(
                    "Location:",
                    location,
                    Icons.location_on,
                    isLocation: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailContainer(String title, String value, IconData icon,
      {bool isLocation = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: AppColors.black, size: 28),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: textStyleBold(AppColors.black)),
                    const SizedBox(height: 4),
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
        ),
      ),
    );
  }

  Widget buildSlotTimingContainer(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.schedule, color: AppColors.black, size: 28),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: textStyleBold(AppColors.black)),
                        const SizedBox(height: 4),
                        Text(value, style: textStyleRegular()),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildActionButton(
                    icon: Icons.edit_calendar,
                    label: "Reschedule/Cancel",
                    onTap: () {},
                  ),
                  buildActionButton(
                    icon: Icons.add_alarm,
                    label: "Add to Calendar",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActionButton(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(12),
            child: Icon(icon, color: AppColors.green, size: 28),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
