import 'package:flutter/material.dart';
import 'package:uts_mob/komponen/mylist.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onLogout;
  //final void Function()? onProfileTap;
  final void Function()? onAboutTap;
  const MyDrawer({super.key, required this.onLogout, required this.onAboutTap,});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: [
          const DrawerHeader(child: Icon(Icons.person, color: Colors.white, size: 64,),),

          MyListTile(icon: Icons.home, text: 'H O M E', onTap: () => Navigator.pop(context),),
          //MyListTile(icon: Icons.person, text: 'P R O F I L E', onTap: onProfileTap,),
          MyListTile(icon: Icons.logout, text: 'L O G O U T', onTap: onLogout,),
          MyListTile(icon: Icons.android_sharp, text: 'A B O U T', onTap: onAboutTap,),
        ],
      ),
    );
    
  }
}