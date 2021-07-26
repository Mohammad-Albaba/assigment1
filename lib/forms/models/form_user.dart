import 'package:assigment1/ui/home/ui/customer_page.dart';
import 'package:assigment1/ui/home/ui/mershant_page.dart';
import 'package:assigment1/ui/register/customer_register_page.dart';
import 'package:assigment1/ui/register/main_register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormUser{
  UserType userType;
  String email;
  String password;
  String phone;
  String shopName;
  String bio;
  String category;
  String shopAddress;

  FormUser.customer({
    @required this.email,
    @required this.password,
    this.userType = UserType.Customer});

  FormUser.mershant({
    @required this.email,
    @required this.password,
    @required this.phone,
    @required this.shopName,
    @required this.bio,
    @required this.category,
    @required this.shopAddress,
    this.userType = UserType.Mershant});

  FormUser.formUserType(UserType userType, BuildContext context){
    if(userType == UserType.Mershant){
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return MershantPage();
      }));
    }else{
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return CustomerPage();
      }));
    }
  }
  factory FormUser.map(Map map){
    if(map['isMershant'] == true){
      return FormUser.mershant(
          email: map['email'],
          password: map['password'],
          phone: map['phone'],
          shopName: map['shopName'],
          bio: map['bio'],
          category: map['category'],
          shopAddress: map['shopAddress']);
    }else{
      return FormUser.customer(email:map['email'], password: map['password'],);
    }
  }

  Map<String, dynamic> toMap(){
    Map map = this.userType == UserType.Customer
        ?{
      'isMershant': false,
      'email': this.email,
      'password': this.password}
        : {
      'isMershant': true,
      'email': this.email,
         'password': this.password,
         'shopName': this.shopName,
         'shopAddress': this.shopAddress,
         'bio': this.bio,
         'category': this.category,
          };
    return {...map};
  }


}