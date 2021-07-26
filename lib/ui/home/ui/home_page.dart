import 'package:assigment1/forms/globals.dart';
import 'package:assigment1/forms/helpers/files_helper.dart';
import 'package:assigment1/forms/helpers/shared_prefrences_helper.dart';
import 'package:assigment1/forms/helpers/url_launcher_helpers.dart';
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
            child: Text(
                Globals.globals.formUser.userType == UserType.Customer?
            'hi i am customer, my email is ${Globals.globals.formUser.email} and my password is ${Globals.globals.formUser.password}'
             : 'hi i am mershant, my email is ${Globals.globals.formUser.email}, and my password is ${Globals.globals.formUser.password}, my shop name is ${Globals.globals.formUser.shopName}, and my address is ${Globals.globals.formUser.shopAddress},and my bio is ${Globals.globals.formUser.bio},${Globals.globals.formUser.category},my phone is ${Globals.globals.formUser.phone}'
            )
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: ElevatedButton(
              child: Text('SignOut'),
              onPressed: (){
                // SpHelper.spHelper.signOut();
                // FilesHelper.filesHelper.readFromFile('gsk');
                UrlLauncherHelper.urlLauncherHelper.openWhatsappChat();
                UrlLauncherHelper.urlLauncherHelper.shareContent();
              },
            ),
          ),
        ],
      ),

    );
  }
}
