import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/views/chat_page/chat_page.dart';
import 'package:flutter/material.dart';


class MyUserListBlock extends StatelessWidget {

  final UserModel user;
  final String userid;
  const MyUserListBlock({super.key,required this.user,required this.userid});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(receiverID: user.uid, senderID: userid,user: user,),));
      },
      child: Container(
       decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
    
        borderRadius: BorderRadius.circular(8)
       ),
        margin: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
       height: 80,
       width: double.infinity,
    
        child: Row(
          children: [
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 8),
             child: CircleAvatar(
              
              radius: 50,
           
              backgroundImage: NetworkImage(user.url,),
             ),
           ),
    
           Expanded(
             child: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Text(user.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),)),
           )
          ],
        ),
      ),
    );
    
  }
}