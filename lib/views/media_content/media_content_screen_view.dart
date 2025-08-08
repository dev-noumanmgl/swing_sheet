import 'package:flutter/material.dart';
import 'package:swing_sheet/core/constants/app_colors.dart';
import 'package:swing_sheet/core/utils/textStyles.dart';

class MediaContentScreenView extends StatefulWidget {
  const MediaContentScreenView({super.key});

  @override
  State<MediaContentScreenView> createState() => _MediaContentScreenViewState();
}

class _MediaContentScreenViewState extends State<MediaContentScreenView> {
  String selectedTab = 'All';

  final List<Map<String, dynamic>> mediaList = [
    {
      "title": "Golf Swing Highlights",
      "type": "video",
      "thumbnail": "assets/images/media/video1_thumbnail.jpg",
    },
    {
      "title": "Golf Basics - Photo Gallery",
      "type": "image",
      "thumbnail": "assets/images/media/photo1.jpg",
    },
    {
      "title": "Pro Instructor Session",
      "type": "video",
      "thumbnail": "assets/images/media/video2_thumbnail.jpg",
    },
    {
      "title": "Training Day Memories",
      "type": "image",
      "thumbnail": "assets/images/media/photo2.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredMedia = selectedTab == 'All'
        ? mediaList
        : mediaList.where((item) => item['type'] == selectedTab.toLowerCase()).toList();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.black,
        title: Text("Media Content", style: textStyleH2(AppColors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['All', 'Photos', 'Videos'].map((tab) {
                final isActive = selectedTab == tab;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = tab;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.green : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tab,
                      style: textStyleRegular().copyWith(
                        color: isActive ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Media List
            Expanded(
              child: ListView.builder(
                itemCount: filteredMedia.length,
                itemBuilder: (context, index) {
                  final media = filteredMedia[index];
                  return _buildMediaCard(media);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMediaCard(Map<String, dynamic> media) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.asset(
              media['thumbnail'],
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
            if (media['type'] == 'video')
              Positioned(
                top: 70,
                left: MediaQuery.of(context).size.width / 2 - 30,
                child: Icon(Icons.play_circle_fill, size: 60, color: Colors.white70),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                color: Colors.black.withOpacity(0.5),
                child: Text(
                  media['title'],
                  style: textStyleBold(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
