import 'package:assigment1/assignment/data/data_source.dart';
import 'package:assigment1/assignment/ui/widgets/productWidget.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  Function function;
  FavouritePage(this.function);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.where((element) => element.isFavourite).length,
        itemBuilder: (context, index){
          return ProductWidget(products.where((element) => element.isFavourite).toList()[index], function);
        });
  }
}

