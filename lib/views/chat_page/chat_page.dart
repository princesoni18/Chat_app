

import 'package:chat_app/controllers/services/chat_service.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/views/components/MyTextField.dart';
import 'package:chat_app/views/components/chat_box.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {
  final receiverID;
  final senderID;
  final UserModel user;
 
  

  ChatPage({super.key, required this.receiverID, required this.senderID,required this.user});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
    leadingWidth: 30,
      elevation: 0.0,
      backgroundColor: Colors.grey[300],
      foregroundColor: Colors.black,
           title: Row(
            
            children: [
   Padding(

              padding: const EdgeInsets.only(top: 5),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(user.url),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(user.name),
            )

            ],
           ),
          // leading: 
         
        
        ),
      ),
        body: Column(
          children: [
            Expanded(
                child:
                    Message_List(senderID: senderID, receiverID: receiverID)),
            _sendMessage(receiverID),
          ],
        ),
      
    );
  }







  
   
}

class Message_List extends StatelessWidget {
  final FirebaseAuth _auth=FirebaseAuth.instance;
   Message_List({
    super.key,
    required this.senderID,
    required this.receiverID,
  });

  final String senderID;
  final String receiverID;

  @override
  Widget build(BuildContext context) {
   
    return StreamBuilder(
      stream: ChatService().getMessages(senderID, receiverID),
      
      builder: (context, snapshot) {
     
        if (snapshot.hasError) {
          return Center(
            child: Text("some error occured"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((doc) => _listItems(doc)).toList(),
        );

        
      },
    );
  }

  Widget _listItems(DocumentSnapshot snap) {


  final Message msg = Message.fromJson(snap.data() as Map<String, dynamic>);
  
  bool align=_auth.currentUser!.uid==msg.senderID?true:false;
   
  return Container(
   margin: EdgeInsets.all(8),
   alignment: align?Alignment.centerRight:Alignment.centerLeft,
    
    
    child:ChatBubble(IscurrentUser: align, text: msg.message)
  );
}

 
}



Widget _sendMessage(String receiverID) {
  final TextEditingController _messageController = TextEditingController();
  void _sendText(String receiverID)async{


  if(_messageController.text.isEmpty){
    return;
  }
  else{
   ChatService().sendMessage(receiverID, _messageController.text);

   _messageController.clear();

  }
}


  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Row(
      children: [
        Expanded(
          
            child: MyTextField(
             hinttext: "Type Your Message",
              controller: _messageController,
            ),
          
        ),
        GestureDetector(
          onTap: () =>_sendText(receiverID),
          
          child: Container(
            height: 50,
            width: 50,
           margin: EdgeInsets.only(left: 10), 
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle
            ),
            
            
            child: Icon(Icons.arrow_upward_rounded,size: 35,color: Colors.grey[100],)))
      ],
    ),
  );
}


