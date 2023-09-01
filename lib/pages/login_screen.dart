// ignore_for_file: unused_import, avoid_web_libraries_in_flutter, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:multirole_app/pages/home_screen.dart';
import 'package:multirole_app/pages/student_screen.dart';
import 'package:multirole_app/pages/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import 'admin_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final formdata = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: 'Sign up'.text.make(),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
          ),
          20.heightBox,
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
          20.heightBox,
          TextFormField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Age',
            ),
          ),
          40.heightBox,
          InkWell(
            onTap: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.setString('email', emailController.text.toString());
              sp.setString('age', ageController.text.toString());
              sp.setBool('isLogin', true);

              sp.setString('userType', 'teacher');
              if (sp.getString('userType') == 'student') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentScreen()));
              } else if (sp.getString('userType') == 'teacher') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TeacherScreen()));
              } else if (sp.getString('userType') == 'admin') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminScreen()));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }
            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.green,
              child: Center(
                child: 'Sign up'.text.color(Colors.black).make(),
              ),
            ),
          )
        ],
      ).px20(),
    );
  }
}
