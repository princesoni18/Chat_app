import 'package:chat_app/themes/dark_theme.dart';
import 'package:chat_app/themes/light_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

 ThemeData _theme=Light_Mode;

 ThemeData get themeData =>_theme;

 bool get isdarkmode => _theme==dark_mode;
 

 set themeData(ThemeData themecurr){

  _theme=themecurr;

  notifyListeners();
 }

  void toggle(){
  if(_theme==Light_Mode){

    themeData=dark_mode;
    
  }
  else{
    themeData=Light_Mode;
  }

   
  }


}