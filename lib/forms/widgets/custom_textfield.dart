import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String label = '';
  bool isPassword;
  TextEditingController controller;
  CustomTextField(this.label, this.controller,[this.isPassword = false]);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObsecure = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        obscureText: isObsecure,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: Visibility(
            visible: widget.isPassword,
            child: IconButton(
              icon: Icon(Icons.remove_red_eye),
              onPressed: (){
                this.isObsecure = !this.isObsecure;
                setState(() {});
              },
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: widget.label,
          fillColor: Colors.blue.withOpacity(0.2),
          filled: true
        ),
      ),
    );
  }
}
