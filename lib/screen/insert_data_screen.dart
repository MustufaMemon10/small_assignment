import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentlist_floor/entity/Dao.dart';

import '../entity/student_entity.dart';

class InsertDataScreen extends StatefulWidget {
  final StudentDao studentDao;

  const InsertDataScreen({super.key, required this.studentDao});

  @override
  State<InsertDataScreen> createState() => _InsertDataScreenState();
}

class _InsertDataScreenState extends State<InsertDataScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image Selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Student Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration:  InputDecoration(
                border: OutlineInputBorder(
                 borderSide:  BorderSide(width: 1.0,color: Colors.green.shade500),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                  labelText: 'Name'),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _ageController,
              decoration:  InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:  BorderSide(width: 1.0,color: Colors.green.shade500),
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed:  ()=> pickImage(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text('Pick Image',style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600
              ),),
            ),
            const SizedBox(height: 24),

            _image == null
                ? const Text('No image selected.')
                : Image.file(_image!, height: 100),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () async {
                  final name = _nameController.text;
                  final age = int.parse(_ageController.text);



                  final imageUrl = _image!.path;

                  final student =Student(name: name, age: age, imageUrl: imageUrl);
                  await widget.studentDao.insertStudent(student);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Student added successfully!'),
                    backgroundColor: Colors.green,),
                  );

                  _nameController.clear();
                  _ageController.clear();
                  setState(() {
                    _image = null;
                  });
                },
                child: const Text('Insert Student',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
