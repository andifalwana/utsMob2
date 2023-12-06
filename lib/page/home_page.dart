import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uts_mob/komponen/navigator.dart';
import 'package:uts_mob/komponen/post.dart';
import 'package:uts_mob/komponen/textfield.dart';
import 'package:uts_mob/page/about.dart';

//import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final currentUser = FirebaseAuth.instance.currentUser!;
  final textcontroller = TextEditingController();

  void logout(){
    FirebaseAuth.instance.signOut();
  }
  void postMessage(){
    if(textcontroller.text.isNotEmpty){
      FirebaseFirestore.instance.collection("User Post").add({
        'UserEmail': currentUser.email,
        'Message' : textcontroller.text,
        'TimeStamp': Timestamp.now(),
      });
    }
    setState(() {
      textcontroller.clear();
    });
  }
  // void goToProfilePage(){
  //   Navigator.pop(context);
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),),);
  // }
  void goToAboutPage(){
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyAbout(),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("What's STTB"),
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout),
          ),
        ],
      ),
      drawer: MyDrawer(
        //onProfileTap: goToProfilePage,
        onLogout: logout,
        onAboutTap: goToAboutPage,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(stream: FirebaseFirestore.instance.collection("User Post").orderBy("TimeStamp", descending: false).snapshots(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return ListView.builder(itemCount: snapshot.data!.docs.length, itemBuilder: (context, index) {
                    final post = snapshot.data!.docs[index];
                    return MyPost(message: post['Message'], user: post['UserEmail'],);
                  },
                  );
                } else if (snapshot.hasError){
                  return Center(child: Text('Error${snapshot.error}'),
                  );
                }
                return const Center(child: CircularProgressIndicator(),);
              },
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Expanded(child: MyTextField(controller: textcontroller, hintText: 'Tulis sesuatu', obsecureText: false,),
                  ),
                  IconButton(onPressed: postMessage, icon: const Icon(Icons.arrow_circle_up),)
                ],
              ),
            ),
            Text("User : " + currentUser.email!, style: TextStyle(color: Colors.grey),),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}