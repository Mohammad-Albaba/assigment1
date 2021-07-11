import 'package:assigment1/forms/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// *************Form Login Screen ************************
class FormUi extends StatefulWidget {
  @override
  _FormUiState createState() => _FormUiState();
}

class _FormUiState extends State<FormUi> {
  String value = '';

 TextEditingController emailController = TextEditingController();

 TextEditingController passwordController = TextEditingController();

 bool checkBoxValue = false;

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
          CustomTextField('Email',emailController),
          CustomTextField('Password',passwordController, true),
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