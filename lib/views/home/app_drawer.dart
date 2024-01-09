import 'package:chat_app/controllers/services/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Padding(
        padding: const EdgeInsets.only(top: 60,bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Column(
            children: [
              Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text("Prince Soni"),
          ),
          
      
          ListTile(
            leading: Icon(Icons.home_rounded),
            title: Text("H O M E"),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("S E T T I N G S"),
          ),
            ],
          ),

          
       ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("LOG OUT"),
            onTap: () => AuthService().logOutUser(),
          ),
          
        ]),
      ),
    );
  }
}