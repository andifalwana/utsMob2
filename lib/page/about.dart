import 'package:flutter/material.dart';

import '../komponen/textbox.dart';

class MyAbout extends StatefulWidget {
  const MyAbout({super.key});

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text('About Page'),
      backgroundColor: Colors.grey[900],),
      body: ListView(
              children: [
                const SizedBox(height: 50),
                  Icon(Icons.android, size: 72,
                  ),
                const SizedBox(height: 10),
                Text(
                  "Tentang Saya",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700]),
                  ),
                const SizedBox(height: 50),
                Padding(padding: const EdgeInsets.only(left: 25.0),
                  child: Text("Data Develover",
                  style: TextStyle(color: Colors.grey[600]),),
                ),
                MyTextBox(text: 'Andi Falwana', sectionName: 'Nama'),
                MyTextBox(text: 'TIF RM 221 MC', sectionName: 'Kelas')
              ],
            ),
    );
  }
}