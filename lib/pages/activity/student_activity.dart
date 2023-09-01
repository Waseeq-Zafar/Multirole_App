import 'package:flutter/material.dart';
import 'package:multirole_app/pages/splash_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class StudentActivityPage extends StatelessWidget {
  final List<ActivityItem> activities = [
    ActivityItem(
      title: 'Homework',
      icon: Icons.assignment,
    ),
    ActivityItem(
      title: 'Exams',
      icon: Icons.book,
    ),
    ActivityItem(
      title: 'Projects',
      icon: Icons.work,
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
          title: Text('Student Activity Page'),
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
                    builder: (context) => StudentActivityDetailPage(
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

class StudentActivityDetailPage extends StatelessWidget {
  final ActivityItem activity;

  StudentActivityDetailPage({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              activity.icon,
              size: 80,
              color: Colors.blue,
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
