import 'package:chat_app/firebase_options.dart';

import 'package:chat_app/themes/light_theme.dart';
import 'package:chat_app/themes/theme_provider.dart';
import 'package:chat_app/views/home/home_page.dart';
import 'package:chat_app/views/login_page/login_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    
   create: (context) => ThemeProvider(), 
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: Provider.of<ThemeProvider>(context).themeData,
    home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.active){
        if(snapshot.hasData){
          return Homepage();
        }
        else if(snapshot.hasError){
          return const Center(child:  Text("Some Error Occured"),);
    
        }
        
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(child:  CircularProgressIndicator(color: Colors.greenAccent,),);
        }
        return Login_Page();
      }),
    );
  }
}

