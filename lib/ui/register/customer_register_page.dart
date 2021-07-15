import 'package:assigment1/forms/models/form_user.dart';
import 'package:assigment1/forms/widgets/custom_textfield.dart';
import 'package:assigment1/ui/home/ui/home_page.dart';
import 'package:flutter/material.dart';

class CustomerRegister extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>() ;

  String email;
  String password;
  setEmail(String email){
    this.email = email;
  }
  setPassword(String password){
    this.password = password;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [

          Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
              onSaved: (v){
                setEmail(v);
              },
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Email',
                  fillColor: Colors.blue.withOpacity(0.2),
                  filled: true
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
              onSaved: (v){
                setPassword(v);
              },
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Password',
                  fillColor: Colors.blue.withOpacity(0.2),
                  filled: true
              ),
            ),
          ),

          // CustomTextField('Email',emailController,this.onSaved),
          // CustomTextField('Password',passwordController,onSaved,true),


          ElevatedButton(
            child: Text(
              'Sign Up As Customer'
            ),
           onPressed: () async {
            if(formKey.currentState.validate()){
              formKey.currentState.save();
              FormUser formUser = FormUser.customer(email: email, password: password);
              String result = await Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return HomePage(formUser);
              }));
              print(result);
            }
            }
            ),
        ],
      ),
    );
  }
}
