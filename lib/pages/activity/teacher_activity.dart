// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:multirole_app/pages/splash_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class TeacherActivityPage extends StatelessWidget {
  final List<ActivityItem> activities = [
    ActivityItem(
      title: 'Create Assignment',
      icon: Icons.assignment,
    ),
    ActivityItem(
      title: 'Grade Assignments',
      icon: Icons.grade,
    ),
    ActivityItem(
      title: 'Schedule Exam',
      icon: Icons.schedule,
    ),
    // Add more activities here
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          false, // Prevents back navigation on device gesture or hardware back button
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green,
          title: Text('Teacher Activity Page'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout_sharp),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: activities.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(activities[index].icon),
              title: Text(activities[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeacherActivityDetailPage(
                      activity: activities[index],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ActivityItem {
  final String title;
  final IconData icon;

  ActivityItem({
    required this.title,
    required this.icon,
  });
}

class TeacherActivityDetailPage extends StatelessWidget {
  final ActivityItem activity;

  TeacherActivityDetailPage({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(activity.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              activity.icon,
              size: 80,
              color: Colors.green,
            ),
            SizedBox(height: 30),
            'This is the ${activity.title} Page'.text.xl3.make().px20(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
