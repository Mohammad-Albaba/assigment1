import 'package:assigment1/forms/models/form_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String label = '';
  bool isPassword;
  TextEditingController controller;
  final Function onSaved;
  CustomTextField(this.label, this.controller,[this.onSaved,this.isPassword = false]);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObsecure = false;
  Function onSaved;

  // FormUser formUser;
  // get onSaved{
  //   return formUser;
  // }

  // String email;
  // String password;
  // setEmail(String email){
  //   this.email = email;
  // }
  // setPassword(String password){
  //   this.password = password;
  // }
  // onSaved(v){
  //   setEmail(v);
  //   setPassword(v);
  //
  // }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        onSaved: onSaved,
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
