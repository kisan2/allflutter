import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:foodapp/screen/widgets/text_feild.dart';
import 'package:foodapp/screen/widgets/texto.dart';
import 'package:foodapp/screen/widgets/button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget categories({
    @required String image,
    @required String name,
  }) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    image,
                  )),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 15, color: Colors.white),
        )
      ],
    );
  }

  Widget bottomContainer({
    @required String image,
    @required String name,
    @required int price,
  }) {
    return Container(
      height: 270,
      width: 200,
      decoration: BoxDecoration(
          //image: DecorationImage(image: AssetImage(image,)),
          color: Color(0xff3a3e3e),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(image),
          ),
          ListTile(
            leading: Text(
              name,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            trailing: Text('\$$price',
                style: TextStyle(fontSize: 15, color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget drawerItem({
    @required String name,
    @required IconData icon
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(name,
          style: TextStyle(
              color: Colors.white, fontSize: 20,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            color: Color(0xff2b2b2b),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('image/background.png'),
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('image/avatar.webp'),
                    ),
                    accountName: Text('Kisan'),
                    accountEmail: Text('kisanmahat2@gmail.com'),
                  ),

                  drawerItem(name: 'Profile', icon:Icons.person ),
                  drawerItem(name: 'Cart', icon:Icons.add_shopping_cart ),
                  drawerItem(name: 'Order', icon:Icons.shop ),
                  drawerItem(name: 'About', icon:Icons.info),


                  Divider(
                    thickness: 3,

                    color: Colors.white,
                  ),
                  ListTile(
                    leading: Text('Communication',
                  style: TextStyle(color: Colors.white,
                  fontSize: 20),), 
                  ),

                 
                   drawerItem(name: 'Change', icon:Icons.lock ),
                    drawerItem(name: 'Log Out', icon:Icons.exit_to_app ),



                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0.0,

          /*leading:
          IconButton(
            icon: Icon(
              Icons.sort,
              color: Colors.white,
            ),
            onPressed: () {},
          ),*/
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('image/burger1.jpg'),
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: textFormO(
                controller: null,
                obscuretext: false,
                hintText: 'Search Food',
                icon: Icons.search,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categories(image: 'image/piza1.jpg', name: 'All'),
                  categories(image: 'image/burger1.jpg', name: 'Burger'),
                  categories(image: 'image/pizza4.jpg', name: 'Pizza'),
                  categories(image: 'image/piza3.jpg', name: 'Recipies'),
                  categories(image: 'image/burger2.webp', name: 'Drink'),
                ],
              ),
            ),
            Flexible(
                child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: false,
              primary: false,
              childAspectRatio: 0.8,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              children: [
                bottomContainer(
                    image: 'image/burger1.jpg', name: 'Burger', price: 123),
                bottomContainer(
                    image: 'image/burger1.jpg', name: 'Burger', price: 123),
                bottomContainer(
                    image: 'image/burger1.jpg', name: 'Burger', price: 123),
                bottomContainer(
                    image: 'image/burger1.jpg', name: 'Burger', price: 123),
                bottomContainer(
                    image: 'image/burger1.jpg', name: 'Burger', price: 123)
              ],
            ))
          ],
        ));
  }
}
