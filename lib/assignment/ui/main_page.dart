import 'package:assigment1/assignment/data/data_source.dart';
import 'package:assigment1/assignment/models/product.dart';
import 'package:assigment1/assignment/ui/pages/favourite_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  toggleProduct(Product product){
    setState(() {
      int index = products.indexOf(product);
      products[index].isFavourite = !products[index].isFavourite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: Image(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1513116476489-7635e79feb27?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2R1Y3R8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'
                    ),
                    fit: BoxFit.cover,
                    height: 250.w,
                    width: 250.w,
                  ),
                    accountName: Text(
                        'Mohammad Albaba'
                    ),
                    accountEmail: Text(
                      'albabam9@gmail.com'
                    ),),
                 ListTile(
                   leading: Icon(Icons.home),
                   trailing: Icon(Icons.arrow_forward_ios),
                   title: Text('Home'),
                   onTap: (){
                     // Navigator.push(context,
                     // MaterialPageRoute(
                     //     builder: (context) => HomePage(toggleProduct)),);
                   },

                 ),
                FloatingActionButton(
                  onPressed: (){
                    Navigator.push(context,
                           MaterialPageRoute(
                           builder: (context) => FavouritePage(toggleProduct)),);
                  },
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('Favorite'),
                    onTap: (){
                      // Navigator.push(context,
                      //   MaterialPageRoute(
                      //       builder: (context) => FavouritePage(toggleProduct)),);
                    },
                  ),
                ),

              ],
            ),
          ),
          appBar: AppBar(
            title: Text(
                'Ecommerce App'
            ),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home),
                ),
                Tab(icon: Icon(Icons.favorite),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            HomePage(toggleProduct),
            FavouritePage(toggleProduct),
          ],),
        ));
  }
}