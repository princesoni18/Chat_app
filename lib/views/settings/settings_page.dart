
import 'package:chat_app/themes/bloc/theme_bloc.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SettingPage extends StatelessWidget {
  
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeBloc bloc=BlocProvider.of<ThemeBloc>(context,listen: false);
    return Scaffold(
      
      backgroundColor: Theme.of(context).colorScheme.background,

      appBar: AppBar(
        title: FittedBox(child: Text("S E T T I N G S")),
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
            Expanded(
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: Text("Theme Mode")),
            ),

            CupertinoSwitch(value: bloc.getTheme, onChanged: ((value) {
             bloc.add(ThemeChangeEvent());
            }))
          ],
        ),
      ),
    );
  }
}