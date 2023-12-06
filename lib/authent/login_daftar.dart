import 'package:flutter/material.dart';
import 'package:uts_mob/page/daftar_page.dart';
import 'package:uts_mob/page/login_page.dart';

class logindaftar extends StatefulWidget {
  const logindaftar({super.key});

  @override
  State<logindaftar> createState() => _logindaftarState();
}

class _logindaftarState extends State<logindaftar> {

  bool tampilLoginPage = true;

  void togglePages(){
    setState(() {
      tampilLoginPage = !tampilLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(tampilLoginPage){
      return LoginPage(onTap: togglePages);
    }else{
      return MyDaftar(onTap: togglePages);
    }
  }
}