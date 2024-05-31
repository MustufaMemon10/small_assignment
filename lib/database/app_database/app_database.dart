import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:studentlist_floor/entity/Dao.dart';
import 'package:studentlist_floor/entity/student_entity.dart';

part 'app_database.g.dart';

/// Creating Database
@Database(version: 1,entities:[Student])
abstract class AppDatabase extends FloorDatabase{
  StudentDao get studentDao;
}