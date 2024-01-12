import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/themes/dark_theme.dart';
import 'package:chat_app/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool _isDarkmode=false;
  ThemeData _themeData=Light_Mode;
   bool get getTheme => _isDarkmode;
   ThemeData get getThemedata =>_themeData;

  ThemeBloc() : super(ThemeInitial()) {
   
    on<ThemeChangeEvent>(themeChangeEvent);



  }

  FutureOr<void> themeChangeEvent(ThemeChangeEvent event, Emitter<ThemeState> emit) {

    _isDarkmode=!_isDarkmode;
  if(_isDarkmode){
    _themeData=dark_mode;
  }
  else _themeData=Light_Mode;

    emit(ThemeChangeState());
  }
}
