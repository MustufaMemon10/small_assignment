import 'package:floor/floor.dart';


/// Student Model Get values
@entity
class Student{
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final int age;
  final String imageUrl;


  Student({ this.id, required this.name,required this.age,required this.imageUrl});
}