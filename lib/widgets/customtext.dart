import 'package:flutter/material.dart';

class CustomTextField {
  final String title;
  final String placeholder;
  final bool ispass;
  String text;
 
  String err;
  String _value="";
  CustomTextField({this.title="", this.placeholder="", this.ispass=false, this.err="please complete", this.text="", required double fontSize});
  TextEditingController controller = new TextEditingController();
  int i = 0;
  TextFormField textfrofield(){
     return TextFormField(
      controller: controller,
     
      onChanged: (e){
        _value = e;
      },
      validator: (e)=>e!.isEmpty?err:null,
      obscureText: this.ispass,
      decoration: InputDecoration(
        hintText: this.placeholder,
        labelText: this.title,
        labelStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent
          )
        )
      ),
    );
    }
  String get value{
    return _value;
  }
  }

  
