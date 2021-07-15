import 'package:assigment1/forms/models/form_user.dart';
import 'package:assigment1/forms/models/form_user.dart';
import 'package:assigment1/forms/widgets/custom_textfield.dart';
import 'package:assigment1/ui/home/ui/home_page.dart';
import 'package:assigment1/ui/register/customer_register_page.dart';
import 'package:assigment1/ui/register/mershant_register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// *************Form Login Screen ************************
enum UserType{Customer, Mershant}
class MainRegister extends StatefulWidget {

  @override
  _FormUiState createState() => _FormUiState();
}

class _FormUiState extends State<MainRegister> {
  FormUser formUser;
  setFormUser(formuser){
    this.formUser = formuser;
  }
  UserType groupValue = UserType.Customer;
  String value = '';

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool checkBoxValue = false;

  // saveForm(){
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context){
  //     return HomePage(formUser);
  //   }));
  // }
  GlobalKey<FormState> mershantKey = GlobalKey<FormState>();
  GlobalKey<FormState> customertKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              'Register'
          )
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: RadioListTile(
                      title: Text('Customer'),
                      value: UserType.Customer,
                      groupValue: groupValue,
                      onChanged: (v){
                        this.groupValue = v;
                        setState(() {});
                      }),
                ),
                Expanded(
                  child: RadioListTile(
                      title: Text('Mershant'),
                      value: UserType.Mershant,
                      groupValue: groupValue,
                      onChanged: (v){
                        this.groupValue = v;
                        setState(() {});
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  this.groupValue == UserType.Customer?
                      CustomerRegister():
                      MershantRegister(),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return HomePage(formUser);
                    }));
                    if (checkBoxValue){
                      print(emailController.text);
                      print(passwordController.text);
                    }else{
                      print('you have accept our rules first');
                    }
                  },
                  child: Text('Go Home')),
                ],
              ),
            ),
          ),


        ],

      ),
    );
  }
}