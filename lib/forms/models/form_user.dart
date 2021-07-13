import 'package:assigment1/ui/register/main_register_screen.dart';
import 'package:flutter/cupertino.dart';

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


}