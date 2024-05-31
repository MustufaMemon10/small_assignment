

import 'package:floor/floor.dart';
import 'package:studentlist_floor/entity/student_entity.dart';

/// Queries
@dao
abstract class StudentDao{
  @Query('SELECT * FROM Student WHERE age > 10')
  Future<List<Student>>findStudentOlderThanTen();

  @Insert(onConflict : OnConflictStrategy.replace)
  Future<void> insertStudent(Student student);
}