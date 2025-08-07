import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/data/model_data/drawer_model_data.dart';
import 'package:swing_sheet/core/data/models/drawer_model.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';
import 'package:swing_sheet/views/dashBoard/widgets/drawer_view.dart';
import 'package:swing_sheet/widgets/logout_widget.dart';

class ProfileScreenView extends StatefulWidget {
  const ProfileScreenView({super.key});

  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  final List<bool> _selectedServices = [false, false, false];
  final List<bool> _serviceLocations = [false, false, false];
  bool _isLocationEnabled = true;
  String? selectedInstructor;
  List<DrawerModel> drawerDataList = [];

  final List<String> instructors = ["Sport", "Education", "Consulting"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    drawerDataList = getDrawerData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: drawerView(context, drawerDataList),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.green, width: 2),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              value: selectedInstructor,
              hint: const Text(
                "Area of Expertise",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              dropdownColor: AppColors.white,
              icon: Icon(Icons.arrow_drop_down, color: AppColors.black),
              items: instructors
                  .map(
                    (name) => DropdownMenuItem(
                      value: name,
                      child: Text(name, style: textStyleRegular()),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedInstructor = value;
                });
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            Text("Services Offered", style: textStyleH2(AppColors.black)),
            SizedBox(height: screenHeight * 0.01),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    children: List.generate(_selectedServices.length, (index) {
                      return CheckboxListTile(
                        title: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue.shade100,
                              child: Icon(Icons.miscellaneous_services,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: screenWidth * 0.04),
                            Text("Service ${index + 1}"),
                          ],
                        ),
                        value: _selectedServices[index],
                        onChanged: (value) {
                          setState(() {
                            _selectedServices[index] = value!;
                          });
                        },
                      );
                    }),
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text("Services Locations", style: textStyleH2(AppColors.black)),
            SizedBox(height: screenHeight * 0.01),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.015),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    children: List.generate(_serviceLocations.length, (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Location ${index + 1} Enabled",
                              style: TextStyle(fontSize: 16)),
                          CupertinoSwitch(
                            value: _serviceLocations[index],
                            onChanged: (value) {
                              setState(() {
                                _serviceLocations[index] = value!;
                              });
                            },
                          ),
                        ],
                      );
                    }),
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text("Accepted Payment Methods", style: textStyleH2(AppColors.black)),
            SizedBox(height: screenHeight * 0.01),
            Wrap(
              spacing: screenWidth * 0.03,
              runSpacing: screenHeight * 0.02,
              children: [
                _paymentMethodChip("Stripe", CupertinoIcons.creditcard),
                _paymentMethodChip("Apple Pay", CupertinoIcons.creditcard_fill),
                _paymentMethodChip("Google Pay", CupertinoIcons.money_dollar),
                _paymentMethodChip("PayPal", CupertinoIcons.paperplane),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: screenHeight * 0.02, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentMethodChip(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
