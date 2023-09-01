// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unused_import

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multirole_app/pages/admin_screen.dart';
import 'package:multirole_app/pages/home_screen.dart';
import 'package:multirole_app/pages/login_screen.dart';
import 'package:multirole_app/pages/student_screen.dart';
import 'package:multirole_app/pages/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class ChoiceCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget page;

  const ChoiceCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.page,
  });

  @override
  _ChoiceCardState createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<ChoiceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
          _controller.forward();
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
          _controller.reverse();
        });
      },
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.page),
          );
        },
        child: Card(
          color: widget.color,
          child: AnimatedBuilder(
            animation: CurvedAnimation(
              parent: _controller,
              curve: Curves.easeInOut,
            ),
            builder: (context, child) {
              return Transform.scale(
                scale: _isHovered ? _controller.value * 0.05 + 1 : 1.0,
                child: child,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(
                    widget.icon,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Intro().py(64).px12(),
          30.heightBox,
          ChoiceCard(
            title: 'Student',
            icon: Icons.school,
            color: Colors.blue,
            page: StudentScreen(),
          ).px12(),
          SizedBox(height: 20),
          ChoiceCard(
            title: 'Teacher',
            icon: Icons.person,
            color: Colors.green,
            page: TeacherScreen(),
          ).px12(),
          SizedBox(height: 20),
          ChoiceCard(
            title: 'Admin',
            icon: Icons.admin_panel_settings,
            color: Colors.orange,
            page: AdminScreen(),
          ).px12(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Welcome to".text.xl5.bold.color(Colors.deepPurple).start.make(),
        "Portal".text.xl5.bold.color(Colors.deepPurple).start.make(),
        "Chose your role..".text.xl2.start.make().py4(),
      ],
    );
  }
}
