import 'package:assigment1/forms/models/form_user.dart';
import 'package:assigment1/ui/register/main_register_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  FormUser formUser;
  HomePage(this.formUser);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(formUser.userType == UserType.Customer?
            'hi i am customer, my email is ${formUser.email} and my password is ${formUser.password}'
             : 'hi i am mershant, my email is ${formUser.email}, and my password is ${formUser.password}, my shop name is ${formUser.shopName}, and my address is ${formUser.shopAddress},and my bio is ${formUser.bio},${formUser.category},my phone is ${formUser.phone}'
            )
          ),
          ElevatedButton(
            child: Text('SignOut'),
            onPressed: (){
              Navigator.of(context).pop('hello this message from home page');
            },
          ),
        ],
      ),

    );
  }
}
