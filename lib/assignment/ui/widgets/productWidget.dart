import 'package:assigment1/assignment/models/product.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  Function function;
  ProductWidget(this.product, this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
     child: Row(
      children: [
        Container(
          child: Image(
            image: NetworkImage(
              product.image,
            ),
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
        ),
       // Container(
       //  decoration: BoxDecoration(
       //    image: DecorationImage(
       //      fit: BoxFit.cover,
       //      image: NetworkImage(product.image)),
       //        borderRadius: BorderRadius.circular(10)),
       //    ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name),
            Text(product.description),
          ],
        ),),
        IconButton(
          onPressed: (){
            function(product);
          },
            icon: Icon(Icons.favorite,
              color: product.isFavourite ? Colors.red : Colors.white,
            )
        ),
    ],),);
  }

}
