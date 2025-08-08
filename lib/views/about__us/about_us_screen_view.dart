import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';

class AboutUsScreenView extends StatelessWidget {
  const AboutUsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.black,
        title: Text("About Us", style: textStyleH2(AppColors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Logo or Banner
            Image.asset(
              'assets/images/appBanner.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            const SizedBox(height: 24),

            // App description
            Text(
              "Swing Sheet is your go-to platform for easy and professional golf session bookings with experienced instructors. Whether you're a beginner or pro, we help you elevate your swing with confidence.",
              style: textStyleRegular(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Features / Highlights
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Key Features", style: textStyleH2(AppColors.black)),
            ),
            const SizedBox(height: 12),
            _buildBulletPoint("Book sessions with certified golf instructors"),
            _buildBulletPoint("Browse available dates and time slots"),
            _buildBulletPoint("Get instant confirmation and reminders"),
            _buildBulletPoint("Easy cancellations and rebookings"),

            const SizedBox(height: 24),

            // Mission
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Our Mission", style: textStyleH2(AppColors.black)),
            ),
            const SizedBox(height: 12),
            Text(
              "To provide a seamless and modern golf booking experience that saves time, builds skills, and connects golfers with the best instructors.",
              style: textStyleRegular(),
              textAlign: TextAlign.left,
            ),

            const SizedBox(height: 24),

            // Contact Info
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Contact Us", style: textStyleH2(AppColors.black)),
            ),
            const SizedBox(height: 12),
            _buildContactRow(Icons.email, "dev.noumanmgl@gmail.com"),
            const SizedBox(height: 8),
            _buildContactRow(Icons.phone, "+92 3216721636"),

            const SizedBox(height: 24),

            // Version (optional)
            Text(
              "App Version 1.0.0",
              style: textStyleRegular().copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, size: 20, color: AppColors.green),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: textStyleRegular())),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.green),
        const SizedBox(width: 8),
        Text(value, style: textStyleRegular()),
      ],
    );
  }
}
