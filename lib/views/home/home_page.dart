import 'package:chat_app/controllers/services/chat_service.dart';

import 'package:chat_app/views/home/app_drawer.dart';
import 'package:chat_app/views/home/user_listTile.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(

        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text("H O M E")),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: MyDrawer(),

      body:_listUsers(context),
    );
  }
}

Widget _listUsers(BuildContext context){

 final FirebaseAuth _auth=FirebaseAuth.instance;
  return StreamBuilder(stream: ChatService().getUserStream(), builder: (context, snapshot) {

    if(snapshot.hasError){

      return Center(child: Text("some error occured"),);
    }
    if(snapshot.connectionState==ConnectionState.waiting){
      return Center(child: CircularProgressIndicator(),);
    }
    return ListView.builder(
      itemCount: snapshot.data!.length,
      
      itemBuilder: (context, index){
       if(_auth.currentUser!.uid!=snapshot.data![index].uid){
        return MyUserListBlock(user: snapshot.data![index],userid: _auth.currentUser!.uid,);}
        else{
          return Container();
        }
      },);
    
  },);



}