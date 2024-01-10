
import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


class SettingPage extends StatelessWidget {
  
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov=Provider.of<ThemeProvider>(context,listen: false);
    return Scaffold(
      
      backgroundColor: Theme.of(context).colorScheme.background,

      appBar: AppBar(
        title: Text("S E T T I N G S"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      

      body: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        // height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,

          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Theme Mode"),

            CupertinoSwitch(value: prov.isdarkmode, onChanged: ((value) {
              prov.toggle();
            }))
          ],
        ),
      ),
    );
  }
}