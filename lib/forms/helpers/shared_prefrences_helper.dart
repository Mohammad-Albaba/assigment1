import 'dart:convert';

import 'package:assigment1/forms/globals.dart';
import 'package:assigment1/forms/models/form_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper{
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;
  initSharedPreferences()async{
    sharedPreferences =await SharedPreferences.getInstance();
  }

  saveUser(FormUser formUser){
    sharedPreferences.setString('formUser', json.encode({...formUser.toMap()}));
    Globals.globals.formUser = formUser;
  }
  FormUser getUser(){
    String user = sharedPreferences.getString('formUser');
    if(user == null){
      return null;
    }
    Map userMap = json.decode(user);
    FormUser formUser = FormUser.map(userMap);
    Globals.globals.formUser = formUser;
    return formUser;
  }
  signOut(){
    sharedPreferences.remove('formUser');
  }

}