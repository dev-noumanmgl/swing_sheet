import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';
import 'package:swing_sheet/core/utils/validationInputs.dart';
import 'package:swing_sheet/views/auth/register_confirmation_screen_view.dart';
import 'package:swing_sheet/views/auth/widgets/chooseProfileImageBottomSheet.dart';
import 'package:swing_sheet/widgets/commonOutlinedButton.dart';
import 'package:swing_sheet/widgets/inputTextField.dart';

class SignUpScreenView extends StatefulWidget {
  const SignUpScreenView({super.key});

  @override
  State<SignUpScreenView> createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<SignUpScreenView> {
  File? selectedImage;
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
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  InkWell(
                    onTap: () async {
                      final result = await showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12)),
                        ),
                        context: context,
                        builder: (context) {
                          return chooseProfileImagesBottomSheet(context);
                        },
                      );
                      if (result != null) {
                        chooseImage(type: result, context: context);
                      }
                    },
                    child: Container(
                      height: screenWidth * 0.35,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.black,
                          width: 1,
                        ),
                      ),
                      child: ClipOval(
                          child: selectedImage != null
                              ? Image.file(selectedImage!, fit: BoxFit.cover)
                              : Container(
                                  color: AppColors.black,
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: screenWidth * 0.15,
                                    color: AppColors.white,
                                  ),
                                )),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("First Name", style: textStyleBold(AppColors.black)),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  inputTextField(context, CupertinoIcons.person_fill,
                      "First Name...", _firstNameController),
                  SizedBox(height: screenHeight * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Last Name", style: textStyleBold(AppColors.black)),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  inputTextField(context, CupertinoIcons.person_fill,
                      "Last Name...", _lastNameController),
                  SizedBox(height: screenHeight * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email", style: textStyleBold(AppColors.black)),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  inputTextField(context, CupertinoIcons.mail_solid, "Email...",
                      _emailController),
                  SizedBox(height: screenHeight * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text("Contact No.", style: textStyleBold(AppColors.black)),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  inputTextField(context, CupertinoIcons.phone_fill,
                      "Contact No...", _phoneNoController),
                  SizedBox(height: screenHeight * 0.05),
                  InkWell(
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
                              content: Text(firstNameValidationMessage)),
                        );
                        return;
                      }

                      String? lastNameValidationMessage =
                          validateLastName(lastName);
                      if (lastNameValidationMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: AppColors.red,
                              content: Text(lastNameValidationMessage)),
                        );
                        return;
                      }

                      String? emailValidationMessage = validateEmail(email);
                      if (emailValidationMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: AppColors.red,
                              content: Text(emailValidationMessage)),
                        );
                        return;
                      }

                      String? phoneNoValidationMessage =
                          validatePhoneNumber(phoneNo);
                      if (phoneNoValidationMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: AppColors.red,
                              content: Text(phoneNoValidationMessage)),
                        );
                        return;
                      }

                      if (selectedImage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: AppColors.red,
                              content: Text("Please select a profile image")),
                        );
                        return;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RegisterConfirmationScreenView(),
                        ),
                      );
                    },
                    child: commonOutlinedButton(
                      context: context,
                      label: "Submit",
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> chooseImage(
      {required String type, required BuildContext context}) async {
    final picker = ImagePicker();
    final pickedImage = type == "camera"
        ? await picker.pickImage(source: ImageSource.camera)
        : await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }
}
