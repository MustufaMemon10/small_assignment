import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentlist_floor/screen/insert_data_screen.dart';
import 'package:studentlist_floor/screen/student_list.dart';

import 'package:get/get.dart';
import '../entity/Dao.dart';

class HomeScreen extends StatelessWidget {
  final StudentDao studentDao;

  const HomeScreen({super.key, required this.studentDao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Option'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade500,
                ),
                onPressed: () => Get.to(() =>  InsertDataScreen(studentDao: studentDao,)),
                child: const Text('Insert Student Data',style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600
                ),),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade500,
                ),
                onPressed: () => Get.to(() =>  StudentList(studentDao: studentDao)),
                child: const Text('View Students',style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
