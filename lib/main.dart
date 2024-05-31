import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:studentlist_floor/app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:studentlist_floor/entity/Dao.dart';

import 'database/app_database/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final studentDao = database.studentDao;

  runApp(App(studentDao: studentDao));
}


