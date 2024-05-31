import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentlist_floor/screen/home_screen.dart';
import 'package:studentlist_floor/screen/student_list.dart';

import 'entity/Dao.dart';

class App extends StatelessWidget {

  App({ required this.studentDao});

  final StudentDao studentDao;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Student_floor',
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(studentDao: studentDao,),
    );
  }
}
