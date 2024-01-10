import 'package:chat_app/controllers/services/auth_service.dart';
import 'package:chat_app/views/settings/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
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
            child: Text("Prince Soni",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),),
          ),
          
      
          ListTile(
            textColor:Theme.of(context).colorScheme.inversePrimary,
            iconColor: Theme.of(context).colorScheme.inversePrimary,
            leading: Icon(Icons.home_rounded),
            title: Text("H O M E"),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
             textColor:Theme.of(context).colorScheme.inversePrimary,
            iconColor: Theme.of(context).colorScheme.inversePrimary,
            leading: Icon(Icons.settings),
            title: Text("S E T T I N G S"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage(),)),
          ),
            ],
          ),

          
       ListTile(
         textColor:Theme.of(context).colorScheme.inversePrimary,
            iconColor: Theme.of(context).colorScheme.inversePrimary,
            leading: Icon(Icons.logout_rounded),
            title: Text("LOG OUT"),
            onTap: () => AuthService().logOutUser(),
          ),
          
        ]),
      ),
    );
  }
}