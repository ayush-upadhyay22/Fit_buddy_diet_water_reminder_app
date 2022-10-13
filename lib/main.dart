import 'package:flutter/material.dart';
import 'package:waterreminder/register.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false ,
    initialRoute: 'register',
    routes:{
      'register':(context)=>Register()
    },
  ));
}
