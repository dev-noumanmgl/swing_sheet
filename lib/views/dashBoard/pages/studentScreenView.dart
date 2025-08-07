import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/data/model_data/drawer_model_data.dart';
import 'package:swing_sheet/core/data/models/drawer_model.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';
import 'package:swing_sheet/views/dashBoard/widgets/drawer_view.dart';
import 'package:swing_sheet/views/invite_students/invite_student_screen_view.dart';
import 'package:swing_sheet/widgets/logout_widget.dart';

class StudentScreenView extends StatefulWidget {
  const StudentScreenView({super.key});

  @override
  State<StudentScreenView> createState() => _StudentScreenViewState();
}

class _StudentScreenViewState extends State<StudentScreenView> {
  List<DrawerModel> drawerDataList = [];
  final List<Map<String, String>> students = [
    {
      "name": "John Doe",
      "phone": "+1 xxx-xxx-xxx",
      "email": "john.doe@example.com",
      "status": "Active",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Jane Smith",
      "phone": "+1 xxx-xxx-xxx",
      "email": "jane.smith@example.com",
      "status": "Invited",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Alice Brown",
      "phone": "+1 xxx-xxx-xxx",
      "email": "alice.brown@example.com",
      "status": "Active",
      "image": "assets/images/profile.png",
    },
    {
      "name": "John Doe",
      "phone": "+1 xxx-xxx-xxx",
      "email": "john.doe@example.com",
      "status": "Active",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Jane Smith",
      "phone": "+1 xxx-xxx-xxx",
      "email": "jane.smith@example.com",
      "status": "Invited",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Alice Brown",
      "phone": "+1 xxx-xxx-xxx",
      "email": "alice.brown@example.com",
      "status": "Active",
      "image": "assets/images/profile.png",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    drawerDataList = getDrawerData();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Students",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InviteStudentScreenView(),
                        ));
                  },
                  child: Icon(
                    Icons.person_add_alt_1,
                    color: AppColors.black,
                    size: 28,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black.withOpacity(.9),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search students...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: students.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final student = students[index];
                  return buildStudentTile(
                    student["name"]!,
                    student["phone"]!,
                    student["email"]!,
                    student["status"]!,
                    student["image"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStudentTile(
    String name,
    String phone,
    String email,
    String status,
    String image,
  ) {
    // Extract initials from the student's name
    String initials = getInitials(name);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Circle with initials
          Container(
            width: 60, // Size of the circle
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.red,
              shape: BoxShape.circle, // Make it circular
            ),
            child: Center(
              child: Text(initials, style: textStyleH3(AppColors.black)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    Icon(Icons.call,
                        color: status == "Active"
                            ? AppColors.black
                            : AppColors.orange.withOpacity(0.3)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      phone,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    Icon(Icons.message,
                        color: status == "Active"
                            ? AppColors.black
                            : AppColors.orange.withOpacity(0.3)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    Icon(Icons.mail,
                        color: status == "Active"
                            ? AppColors.black
                            : AppColors.orange.withOpacity(0.3)),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: status == "Active"
                        ? AppColors.green.withOpacity(0.3)
                        : AppColors.orange.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: status == "Active" ? AppColors.green : AppColors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Function to get initials from the student's name
  String getInitials(String name) {
    List<String> nameParts = name.split(" ");
    String initials = '';
    if (nameParts.isNotEmpty) {
      initials += nameParts[0][0]; // First letter of the first name
    }
    if (nameParts.length > 1) {
      initials +=
          nameParts[1][0]; // First letter of the last name (if available)
    }
    return initials.toUpperCase(); // Return initials in uppercase
  }
}
