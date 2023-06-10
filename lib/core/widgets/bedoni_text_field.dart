import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BedoniTextField extends StatelessWidget{
  String? label;
  TextEditingController? controller;
  Function(String)? onChanged;
  String? errorText;
  Color color;
  Color? textColor;
  bool? obscure;

  BedoniTextField({this.label,this.controller,this.obscure = false,this.color = Colors.white,this.textColor,this.errorText,this.onChanged});
  @override
  Widget build(BuildContext context) {
    return  TextField(

          onChanged: onChanged,
          controller: controller,
          obscureText:obscure! ,

          style: TextStyle(color:textColor != null ?  textColor: Color(0xff178283) ),
          decoration: InputDecoration(
            errorText: errorText,
            suffixIcon: Icon(Icons.search),


            hintText: label,hintStyle: TextStyle(color:textColor != null ?  textColor: Color(0xff178283)),
          ),

        )
    ;
  }

}