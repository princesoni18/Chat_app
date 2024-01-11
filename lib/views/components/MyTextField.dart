import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final String hinttext;
  final Icon? icon;
  final TextEditingController controller;
  final FocusNode? MyfocusNode;
  
  const MyTextField({super.key,required this.hinttext,required this.controller,this.icon,this.MyfocusNode});

  @override
  Widget build(BuildContext context) {
    return TextField(
    focusNode: MyfocusNode,
      
      controller: controller,
      decoration:  InputDecoration(
        prefixIcon: icon,
hintText: hinttext,
fillColor: Theme.of(context).colorScheme.primary,
        focusedBorder: const  OutlineInputBorder(
          
          borderSide: BorderSide(
            color: Colors.black

          )
        ),
        enabledBorder:   OutlineInputBorder(
          
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary

          )
        ),

       

      ),
    );
  }
}