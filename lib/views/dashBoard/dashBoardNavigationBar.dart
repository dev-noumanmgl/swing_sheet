import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/data/model_data/bottom_navigation_model_data.dart';
import 'package:swing_sheet/core/data/models/bottom_navigation_model.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';

class DashBoardNavigationBar extends StatefulWidget {
  final int index;
  const DashBoardNavigationBar({super.key, required this.index});

  @override
  State<DashBoardNavigationBar> createState() => _DashBoardNavigationBarState();
}

class _DashBoardNavigationBarState extends State<DashBoardNavigationBar> {
  List<BottomNavigationModel> _bottomNavigationModelData = [];
  int? selectedIndex;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index;
    _bottomNavigationModelData = getBottomNavigationModelData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: _bottomNavigationModelData[selectedIndex!].launchPage,
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              ...List.generate(_bottomNavigationModelData.length, (index) {
                BottomNavigationModel modelData =
                    _bottomNavigationModelData[index];
                return Expanded(
                    child: GestureDetector(
                  onTap: () {
                    selectedIndex = index;
                    setState(() {});
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      selectedIndex == index
                          ? Icon(modelData.icon, size: 26, color: AppColors.black)
                          : Icon(modelData.alternateIcon,
                              size: 24, color:  AppColors.black.withOpacity(.4)),
                      Text(modelData.title!,
                          style: textStyleBold(selectedIndex == index
                              ? AppColors.black
                              : AppColors.black.withOpacity(.4)))
                    ],
                  ),
                ));
              })
            ],
          ),
        ),
      ),
    );
  }
}
