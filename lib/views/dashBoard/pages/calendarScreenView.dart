import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/data/model_data/drawer_model_data.dart';
import 'package:swing_sheet/core/data/models/drawer_model.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';
import 'package:swing_sheet/views/dashBoard/widgets/drawer_view.dart';
import 'package:swing_sheet/views/reschedule/reschedule_booking_details_screen_view.dart';
import 'package:swing_sheet/widgets/logout_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreenView extends StatefulWidget {
  const CalendarScreenView({super.key});

  @override
  _CalendarScreenViewState createState() => _CalendarScreenViewState();
}

class _CalendarScreenViewState extends State<CalendarScreenView> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<DrawerModel> drawerDataList = [];

  final List<Map<String, dynamic>> bookings = [
    {
      "date": DateTime(2024, 11, 29),
      "time": "10:00 AM - 10:30 AM",
      "location": "Room A, Downtown Center",
      "instructor": "Mr. Ali",
    },
    {
      "date": DateTime(2024, 11, 21),
      "time": "12:00 PM - 12:30 PM",
      "location": "Room B, Uptown Branch",
      "instructor": "Dr. Sameer",
    },
    {
      "date": DateTime(2024, 11, 18),
      "time": "2:00 PM - 2:30 PM",
      "location": "Room C, Central Hub",
      "instructor": "Dr. Fiaz",
    },
    {
      "date": DateTime(2024, 11, 21),
      "time": "1:00 PM - 1:30 PM",
      "location": "Room B, Central Hub",
      "instructor": "Mr. Usman",
    },
    {
      "date": DateTime(2024, 11, 21),
      "time": "3:00 PM - 3:30 PM",
      "location": "Room G, Central Hub",
      "instructor": "Dr. Ahmad",
    },
  ];

  List<Map<String, dynamic>> getFilteredBookings() {
    if (_selectedDay == null) return bookings;

    return bookings
        .where((booking) => _isSameDay(_selectedDay!, booking["date"]))
        .toList();
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    drawerDataList = getDrawerData();
  }

  @override
  Widget build(BuildContext context) {
    final filteredBookings = getFilteredBookings();

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black.withOpacity(.9),
                ),
              ),
              child: TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime(2020),
                lastDay: DateTime(2050),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: AppColors.black,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  leftChevronIcon: Icon(Icons.chevron_left, color: AppColors.black),
                  rightChevronIcon:
                      Icon(Icons.chevron_right, color: AppColors.black),
                ),
                calendarFormat: CalendarFormat.month,
                selectedDayPredicate: (day) => _selectedDay == null
                    ? false
                    : _isSameDay(_selectedDay!, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: filteredBookings.isEmpty
                ? Center(
                    child: Text(
                      _selectedDay == null
                          ? "All bookings are shown."
                          : "No bookings available for the selected date.",
                      style: textStyleBold(AppColors.black.withOpacity(0.6)),
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: filteredBookings.length,
                    itemBuilder: (context, index) {
                      final booking = filteredBookings[index];
                      return BookingTile(
                        bookingDate: booking["date"],
                        slotTiming: booking["time"]!,
                        location: booking["location"]!,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RescheduleBookingDetailsScreenView(
                                bookingDate: booking["date"]!,
                                slotTiming: booking["time"]!,
                                location: booking["location"]!,
                                instructorName: booking["instructor"]!,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class BookingTile extends StatelessWidget {
  final DateTime bookingDate;
  final String slotTiming;
  final String location;
  final VoidCallback onTap;

  const BookingTile({
    required this.bookingDate,
    required this.slotTiming,
    required this.location,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${bookingDate.weekday}, ${bookingDate.day} ${bookingDate.month} ${bookingDate.year}",
                  style: textStyleBold(AppColors.black),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.schedule, color: AppColors.black, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      slotTiming,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, color: AppColors.black, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        location,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
