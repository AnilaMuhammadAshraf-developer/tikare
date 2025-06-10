import 'package:flutter/material.dart';
class AppValidations{

   String? isEmptyField(String? value,String field){
     if(value==null || value.trim().isEmpty){
      return "$field can't be empty.";
     }
   }
}