import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text(
                    '0'
                  ),
                ),
                accountName: Text(
                 'Mohammad'
                ),
                accountEmail: Text(
                  'albabam9@gmail.com'
                ),),
            ListTile(
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('Favorite'),
            ),
            ListTile(
              leading: Icon(Icons.perm_identity),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Responsive'
        ),
      ),
      body: Container(
        width: 200.w,
        color: Colors.red,
      ),
    );
  }
}
