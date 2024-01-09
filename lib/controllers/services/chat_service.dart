import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService{


final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;

  Stream<List<UserModel>> getUserStream(){

    return _firestore.collection('users').snapshots().map((snapshot){

      return snapshot.docs.map((doc){
       
       // print(doc.data());
        final UserModel user=UserModel.fromJson(doc.data());

       

        return user;
      }).toList();
    });


  }


  Future<void> sendMessage(String receiverID,String message )async{

    String currentUserId=_auth.currentUser!.uid;
    String currentUserEmail=_auth.currentUser!.email!;

    final Timestamp time=Timestamp.now();

    final mes=Message(message: message,
    senderEmail: currentUserEmail,
    senderID: currentUserId,
    receiverID: receiverID,
    timestamp: time);

    List<String> ids=[currentUserId,receiverID];

    ids.sort();

    String chatRoomId=ids.join('_'); 

    await _firestore.collection('chatRooms').doc(chatRoomId).collection("messages").add(mes.toJson());

  }

  Stream<QuerySnapshot> getMessages(String senderID,String receiverID){
   

    List<String> ids=[senderID,receiverID];

    ids.sort();

    String chatRoomId=ids.join('_');
  
    

    return  _firestore.collection('chatRooms').doc(chatRoomId).collection('messages').orderBy('timestamp',descending: false).snapshots();


  }

}