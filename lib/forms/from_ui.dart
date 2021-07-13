import 'package:assigment1/forms/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// *************Form Login Screen ************************
enum Gender{Male, Female}
class FormUi extends StatefulWidget {

  @override
  _FormUiState createState() => _FormUiState();
}

class _FormUiState extends State<FormUi> {
  Gender groupValue;
  String value = '';

 TextEditingController emailController = TextEditingController();

 TextEditingController passwordController = TextEditingController();

 bool checkBoxValue = false;
  String email;
  setEmail(String email){
    this.email = email;
  }
 String password;
 setPassword(String password){
   this.password = password;
 }
  onSaved(v){
    setPassword(v);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'From Ui'
        )
      ),
      body: Column(
        children: [
          CustomTextField('Email',emailController,onSaved),
          CustomTextField('Password',passwordController, onSaved,true),
          CheckboxListTile(
              title: Text(
                'Accept'
              ),
              value: checkBoxValue,
              onChanged: (v){
               this.checkBoxValue = v;
               setState(() {});
              },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Gender'),
                RadioListTile(
                    title: Text('Male'),
                    value: Gender.Male,
                    groupValue: groupValue,
                    onChanged: (v){
                      this.groupValue = v;
                      setState(() {});
                    }),
                RadioListTile(
                    title: Text('Female'),
                    value: Gender.Female,
                    groupValue: groupValue,
                    onChanged: (v){
                      this.groupValue = v;
                      setState(() {});
                    }),
            ],),
          ),

          ElevatedButton(onPressed: (){
              if (checkBoxValue){
                print(emailController.text);
                print(passwordController.text);
              }else{
                print('you have accept our rules first');
              }

              },
              child: Text(
            'Print TextField Content'
          )),

        ],
      ),
    );
  }
}
// Login Screen