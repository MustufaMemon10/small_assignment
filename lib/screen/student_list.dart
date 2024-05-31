import 'package:flutter/material.dart';
import 'package:studentlist_floor/entity/Dao.dart';

import '../entity/student_entity.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key, required this.studentDao});

  final StudentDao studentDao;

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  late Future<List<Student>> _studentsFuture;

  @override
  void initState() {
    super.initState();
    _studentsFuture = widget.studentDao.findStudentOlderThanTen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Data'),
      ),
      body: FutureBuilder<List<Student>>(
          future: _studentsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }
            else if(!snapshot.hasData || snapshot.data!.isEmpty){
              return const Center(child: Text('No data found try again',
              ),);
            }
            else {
              final students = snapshot.data!;
              return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index){
                    final student = students[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 35,
                        child: Image.network(student.imageUrl,width: 30,height: 30,fit:BoxFit.cover,),
                      ),
                        title: Text('Name : ${student.name}'),
                        subtitle: Text('Age: ${student.age}'),
                    );
              });
            }
          }
          ),
    );
  }
}
