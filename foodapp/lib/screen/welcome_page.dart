import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {

  //widget for button
  Widget button({
    @required String name,
     Color color,
     Color textColor
     }) {
    return Container(
      width: 300,
      height: 45,
      //one type of button in flutter
      child: RaisedButton(
        onPressed: () {},
        color: color,
        //changing shape of button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.green,
            width: 1,),
        ),

        child: Text( name,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // makes a child of a Row or Column (also for Flex) expand to fill the available
          //space in the main axis
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                //Image used to add image
                //after enabling assest at pubspec.yaml
                child: Image.asset(
                  'image/food-app.png',
                  width: double.infinity,
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'welcome to kings food',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'roboto',
                      color: Colors.green,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Order form our resturant and',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        'Make resernation in real-time',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          
                        ),
                      ),
                    ],
                  ),

                  button(
                    name: 'LoginPage',
                    color:Colors.green,
                    textColor: Colors.white),
                  button(name: 'SignUp',
                  color:Colors.white,
                  textColor: Colors.green),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
