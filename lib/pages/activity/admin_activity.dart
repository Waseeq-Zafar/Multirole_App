// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:multirole_app/pages/splash_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminActivityPage extends StatelessWidget {
  final List<ActivityItem> activities = [
    ActivityItem(
      title: 'Manage Users',
      icon: Icons.people,
    ),
    ActivityItem(
      title: 'Manage Courses',
      icon: Icons.school,
    ),
    ActivityItem(
      title: 'Generate Reports',
      icon: Icons.bar_chart,
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
          backgroundColor: Colors.orange,
          title: Text('Admin Activity Page'),
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
                    builder: (context) => AdminActivityDetailPage(
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

class AdminActivityDetailPage extends StatelessWidget {
  final ActivityItem activity;

  AdminActivityDetailPage({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(activity.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              activity.icon,
              size: 80,
              color: Colors.orange,
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
