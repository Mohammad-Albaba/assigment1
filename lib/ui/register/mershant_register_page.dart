import 'package:assigment1/forms/helpers/shared_prefrences_helper.dart';
import 'package:assigment1/forms/models/form_user.dart';
import 'package:assigment1/forms/router/router.dart';
import 'package:assigment1/forms/widgets/custom_textfield.dart';
import 'package:assigment1/ui/home/ui/home_page.dart';
import 'package:flutter/material.dart';

class MershantRegister extends StatefulWidget {
  @override
  _MershantRegisterState createState() => _MershantRegisterState();
}

class _MershantRegisterState extends State<MershantRegister> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController shopController = TextEditingController();
  TextEditingController shopAddressController = TextEditingController();
  List categories = ['Fashion','Shoes','Electronics','Medicals','Software'];
  String dropDownValue ='Fashion';
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String email;
  String password;
  String phone;
  String shopName;
  String bio;
  String category;
  String shopAddress;

  // onSave(v){
  //   this.email=v;
  // }
  onSave2(v){
    this.email=v;
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
              onSaved: (v) => this.email = v,
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

          // CustomTextField('Email',emailController,onSave,),

          CustomTextField('Password',passwordController,onSave2,true),
          CustomTextField('Phone',phoneController),
          CustomTextField('Shop Name',shopController),
          CustomTextField('Shop Address',shopAddressController),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
             borderRadius: BorderRadius.circular(15),
              color: Colors.blue.withOpacity(0.2),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: Container(),
              value: this.dropDownValue,
                onChanged: (v){
                 this.dropDownValue = v;
                 setState(() {});
                },
                items: categories.map((e){
                  return DropdownMenuItem<String>(
                      child:Text(e),
                      value: (e),
                  );
                }).toList(),
            ),
          ),

          ElevatedButton(
              child: Text(
                  'Sign Up As Mershant'
              ),
              onPressed: () async {
                FormUser formUser = FormUser.mershant(email: email, password: password, phone: phone, shopName: shopName, bio: bio, category: category, shopAddress: shopAddress);
                SpHelper.spHelper.saveUser(formUser);
                Future<String> result =  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return HomePage(formUser);
                  }));
                  print(result);

                // AppRouter.router.pushFunction(HomePage(formUser));
                // if(formKey.currentState.validate()){
                //   formKey.currentState.save();
                //   FormUser formUser = FormUser.mershant(email: email, password: password, phone: phone, shopName: shopName, bio: bio, category: category, shopAddress: shopAddress);
                //   String result = await Navigator.of(context).push(MaterialPageRoute(builder: (context){
                //     return HomePage(formUser);
                //   }));
                //   print(result);
                // }
              }
          ),
        ],
      ),
    );
  }
}

