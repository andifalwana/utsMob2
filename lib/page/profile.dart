
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:uts_mob/komponen/textbox.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {

//   final currentUser = FirebaseAuth.instance.currentUser!;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(title: Text("Profile Page"),
//       backgroundColor: Colors.grey[900],
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.email).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData){
//             final userData = snapshot.data!.data() as Map<String, dynamic>;
            
//             return ListView(
//               children: [
//                 const SizedBox(height: 50),
//                   Icon(Icons.person, size: 72,
//                   ),
//                 const SizedBox(height: 10),
//                 Text(
//                   currentUser.email!,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.grey[700]),
//                   ),
//                 const SizedBox(height: 50),
//                 Padding(padding: const EdgeInsets.only(left: 25.0),
//                   child: Text("Data Saya",
//                   style: TextStyle(color: Colors.grey[600]),),
//                 ),
//                 MyTextBox(text: userData['username'], sectionName: 'username'),
//                 MyTextBox(text: userData['bio'], sectionName: 'bio')
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error${snapshot.error}'),
//             );
//           }
//           return const Center(child: CircularProgressIndicator(),);
//         },),
//     );
//   }
// }