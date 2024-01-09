import 'dart:typed_data';

import 'package:chat_app/controllers/services/storage_methods.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{

 final  FirebaseAuth _auth= FirebaseAuth.instance;
final FirebaseFirestore _firestore=FirebaseFirestore.instance;

Future<String> LogInUser(String email,String password)async{
String result="fill all fields";
  try{
  if(email.isNotEmpty&&password.isNotEmpty){
    UserCredential response= await _auth.signInWithEmailAndPassword(email: email, password: password);
    result="success";
  }
  else{
    result="enter all fields";
  }
   
   return result;
  }
  
  catch(e){

    return e.toString();
  }


}

Future<String> CreateUser(String email,String name,String password, Uint8List file)async{
String result="nottt";

  try{

    
   if(email.isNotEmpty||password.isNotEmpty||name.isNotEmpty||file!=null){
    UserCredential cred=await _auth.createUserWithEmailAndPassword(email: email, password: password);
    print("uiddd");
     print(cred.user!.uid);
     String url=await Storagemethods().uploadImageToStorage("ProfilePics", file, false);
     
    UserModel user=UserModel(name: name, email: email, url: url, uid: cred.user!.uid);
     await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());

     result="success";
   }
   else{
    result="enter all fields";
   }
     return result;

  }
  catch(e){

    return e.toString();
  }

}
Future<void> logOutUser()async{

  try{
  await _auth.signOut();

  }catch(e){

    print(e.toString());
  }


}
}