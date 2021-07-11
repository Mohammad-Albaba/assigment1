import 'package:assigment1/assignment/data/data_source.dart';
import 'package:assigment1/assignment/ui/widgets/productWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Function function;
  HomePage(this.function);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
        itemBuilder: (context, index){
        return ProductWidget(products[index],function);
        });
  }
}
