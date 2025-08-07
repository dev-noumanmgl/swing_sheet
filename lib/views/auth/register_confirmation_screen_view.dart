import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';
import 'package:swing_sheet/views/auth/signIn_screen_view.dart';
import 'package:swing_sheet/widgets/commonOutlinedButton.dart';

class RegisterConfirmationScreenView extends StatelessWidget {
  const RegisterConfirmationScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset(
                "assets/images/appBanner.png",
                height: screenWidth * 0.5,
                width: screenWidth * 0.5,
              ),
              Spacer(),
              Text(
                "You have successfully registered your account. You will receive an access code via email or SMS. Use this access code to log in to your account.",
                textAlign: TextAlign.center,
                style: textStyleBold(AppColors.black),
              ),
              SizedBox(height: screenHeight * 0.03),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreenView(),
                    ),
                  );
                },
                child: commonOutlinedButton(
                  context: context,
                  label: "Continue",
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
