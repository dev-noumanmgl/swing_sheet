import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';
import 'package:swing_sheet/core/utils/validationInputs.dart';
import 'package:swing_sheet/views/auth/select_role_screen_view.dart';
import 'package:swing_sheet/widgets/commonOutlinedButton.dart';
import 'package:swing_sheet/widgets/inputTextField.dart';

class SignInScreenView extends StatefulWidget {
  const SignInScreenView({super.key});

  @override
  State<SignInScreenView> createState() => _SignInScreenViewState();
}

class _SignInScreenViewState extends State<SignInScreenView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Image.asset(
                    "assets/images/splashLogo.png",
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.3,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: textStyleBold(AppColors.black),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  inputTextField(context, CupertinoIcons.mail_solid, "Email...",
                      _emailController),
                  SizedBox(height: screenHeight * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Access Code",
                      style: textStyleBold(AppColors.black),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  inputTextField(context, CupertinoIcons.eye_slash_fill,
                      "********", _passwordController),
                  SizedBox(height: screenHeight * 0.03),
                  Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () {
                      String email = _emailController.text.trim();
                      String password = _passwordController.text;

                      String? emailValidationMessage = validateEmail(email);
                      if (emailValidationMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColors.red,
                            content: Text(emailValidationMessage!)));
                        return;
                      }

                      String? passwordValidationMessage =
                          validatePassword(password);
                      if (passwordValidationMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColors.red,
                            content: Text(passwordValidationMessage!)));
                        return;
                      }

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         HomeScreenView(isInstructor: false),
                      //   ),
                      // ).then((_) {
                      //   _emailController.clear();
                      //   _passwordController.clear();
                      //   FocusScope.of(context).unfocus();
                      // });
                    },
                    child: commonOutlinedButton(
                      context: context,
                      label: "Login",
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Text("Don't have an account?", style: textStyleRegular()),
                  SizedBox(height: screenHeight * 0.01),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectRoleScreenView(),
                        ),
                      );
                    },
                    child: commonOutlinedButton(
                      context: context,
                      label: "Register",
                      color: AppColors.red,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
