import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';
import 'package:swing_sheet/core/utils/validationInputs.dart';
import 'package:swing_sheet/widgets/commonOutlinedButton.dart';
import 'package:swing_sheet/widgets/inputTextField.dart';
class InviteStudentScreenView extends StatefulWidget {
  const InviteStudentScreenView({super.key});

  @override
  State<InviteStudentScreenView> createState() =>
      _InviteStudentScreenViewState();
}

class _InviteStudentScreenViewState extends State<InviteStudentScreenView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
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
            icon: Icon(CupertinoIcons.profile_circled),
          ),
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Invite New Student",
                          style: textStyleH3(AppColors.black)),
                      SizedBox(height: screenHeight * 0.02),
                      Text("First Name", style: textStyleBold(AppColors.black)),
                      SizedBox(height: screenHeight * 0.01),
                      inputTextField(
                        context,
                        CupertinoIcons.person_fill,
                        "First Name...",
                        _firstNameController,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text("Last Name", style: textStyleBold(AppColors.black)),
                      SizedBox(height: screenHeight * 0.01),
                      inputTextField(
                        context,
                        CupertinoIcons.person_fill,
                        "Last Name...",
                        _lastNameController,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text("Email", style: textStyleBold(AppColors.black)),
                      SizedBox(height: screenHeight * 0.01),
                      inputTextField(
                        context,
                        CupertinoIcons.mail_solid,
                        "Email...",
                        _emailController,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text("Contact No.", style: textStyleBold(AppColors.black)),
                      SizedBox(height: screenHeight * 0.01),
                      inputTextField(
                        context,
                        CupertinoIcons.phone_fill,
                        "Contact No...",
                        _phoneNoController,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "The user will be notified of your invitation",
                              style: textStyleRegular(),
                            ),
                            Text(
                              "via email and SMS.",
                              style: textStyleRegular(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: AppColors.white,
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: InkWell(
                onTap: () {
                  String firstName = _firstNameController.text.trim();
                  String lastName = _lastNameController.text.trim();
                  String email = _emailController.text.trim();
                  String phoneNo = _phoneNoController.text.trim();

                  String? firstNameValidationMessage =
                      validateFirstName(firstName);
                  if (firstNameValidationMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: AppColors.red,
                          content: Text(firstNameValidationMessage!)),
                    );
                    return;
                  }

                  String? lastNameValidationMessage =
                      validateLastName(lastName);
                  if (lastNameValidationMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: AppColors.red,
                          content: Text(lastNameValidationMessage!)),
                    );
                    return;
                  }

                  String? emailValidationMessage = validateEmail(email);
                  if (emailValidationMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: AppColors.red,
                          content: Text(emailValidationMessage!)),
                    );
                    return;
                  }

                  String? phoneNoValidationMessage =
                      validatePhoneNumber(phoneNo);
                  if (phoneNoValidationMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: AppColors.red,
                          content: Text(phoneNoValidationMessage!)),
                    );
                    return;
                  }

                  Navigator.pop(context);
                },
                child: commonOutlinedButton(
                  context: context,
                  label: "Save",
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
