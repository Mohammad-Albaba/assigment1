import 'package:assigment1/forms/from_ui.dart';
import 'package:assigment1/forms/helpers/shared_prefrences_helper.dart';
import 'package:assigment1/forms/models/form_user.dart';
import 'package:assigment1/ui/home/ui/home_page.dart';
import 'package:assigment1/ui/register/main_register_screen.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatelessWidget {
FormUser formUser;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value){
      if(SpHelper.spHelper.getUser() != null){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
          return HomePage(formUser);
        }));
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
          return MainRegister();
        }));
      }
    });
    return Scaffold();
  }
}
