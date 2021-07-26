import 'package:assigment1/assignment/ui/main_page.dart';
import 'package:assigment1/forms/from_ui.dart';
import 'package:assigment1/forms/helpers/shared_prefrences_helper.dart';
import 'package:assigment1/forms/router/router.dart';
import 'package:assigment1/responsive/responsive_screen.dart';
import 'package:assigment1/ui/register/main_register_screen.dart';
import 'package:assigment1/ui/register/splach_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'assignment/data/data_source.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SpHelper.spHelper.initSharedPreferences();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/languages', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: AppRouter.router.navKey,
      home: SplachScreen(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
//بستعملهم للحصول على عرض وارتفاع الشاشة عند استخدام مكتبة ScreenUtilInit
// print(MediaQuery.of(context).size.width);
// print(MediaQuery.of(context).size.height);

class MyPage extends StatelessWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('name'.tr()),
        actions: [
          IconButton(
              icon: Icon(Icons.language),
              onPressed: (){
                Locale locale = EasyLocalization.of(context).locale;
                EasyLocalization.of(context).setLocale(
                  locale == Locale('ar') ? Locale('en') : Locale('ar'));
                print(EasyLocalization.of(context).locale);
              },
              ),
        ],
      ),
      body: GridView.builder(
        itemCount: products.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 1,
              crossAxisCount: 2
          ),
          itemBuilder: (context, index){
               return Stack(
                 children: [
                 Container(
                   height: double.infinity,
                   width: double.infinity,
                   child: Image.network(
                     products[index].image,
                     fit: BoxFit.cover,
                   ),
                 ),
                   Positioned.fill(child: Align(
                     alignment: Alignment.topLeft,
                     child: IconButton(
                       icon: Icon(
                          Icons.favorite,
                          color : Colors.red,
                          size: 40,
                       ),
                      onPressed: (){

                      },
                     ),
                   ),),
                   Positioned.fill(child: Align(
                     alignment: Alignment.bottomRight,
                     child: IconButton(
                       icon: Icon(
                         Icons.favorite,
                         color : Colors.red,
                         size: 40,
                       ),
                       onPressed: (){

                       },
                     ),
                   ),),
                 ],
               );
          }),
    );
  }
}
