import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../komponen/button.dart';
import '../komponen/textfield.dart';

class MyDaftar extends StatefulWidget {
  final Function()? onTap;
  const MyDaftar({super.key, required this.onTap});

  @override
  State<MyDaftar> createState() => _MyDaftarState();
}

class _MyDaftarState extends State<MyDaftar> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final konfirpasswordTextController = TextEditingController();

  void signUp() async{

    showDialog(context: context, builder: (context) => const Center(child: CircularProgressIndicator(),),);

    if(passwordTextController.text != konfirpasswordTextController.text){
      Navigator.pop(context);
      displayMessage("password tidak sama");
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text,);

      FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.email).set({'username' : emailTextController.text.split('@')[0],
      'bio' : 'Empty bio..' 
      });

      if(context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch(e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
    
  }
  void displayMessage(String message) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text(message),
    ),);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50,),
                //logo
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50,),
                //Selamat Datang
                const Text(
                  "Silahkan isi data berikut",
                ),
                const SizedBox(height: 25),
                //email tf
                MyTextField(
                  controller: emailTextController,
                  hintText: 'Masukan Email',
                  obsecureText: false,
                ),
                const SizedBox(height: 10),
                //password tf
                MyTextField(
                  controller: passwordTextController, 
                  hintText: 'Masukan Password', 
                  obsecureText: true,
                ),
                const SizedBox(height: 10),
                //konfirmasi password tf
                MyTextField(
                  controller: konfirpasswordTextController, 
                  hintText: 'Konfirmasi Password', 
                  obsecureText: true,
                ),
                const SizedBox(height: 10),
                //button login
                  MyButton(
                    onTap: signUp, 
                    text: 'DAFTAR'),
                const SizedBox(height: 25),
                //daftar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sudah punya akun?"),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Login sekarang",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
              ),
          ),
        ),
      ),
    );
  }
}