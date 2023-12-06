// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uts_mob/komponen/button.dart';
import 'package:uts_mob/komponen/textfield.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  void Login() async {
    showDialog(context: context, builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text,);

      if(context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  } 

  void displayMessage(String message) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
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
                  "Halo Selamat Datang",
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
                //button login
                  MyButton(
                    onTap: Login, 
                    text: 'LOGIN'),
                const SizedBox(height: 25),
                //daftar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Belum punya akun?"),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Daftar sekarang",
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