import 'package:flutter/material.dart';

import 'package:momo/screen/buttondsn.dart';


class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        
        Expanded(
          child: Container(
            color: Colors.white,
         child:Image.asset('images/logo.png'),
         width: double.infinity,
        ),),

        Expanded(child:Container(
          color: Colors.white,

          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text('Welcome to MO:MO house',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
             ),
            ),
            Column(
              children: [
                Text('for better food and service',
                style: TextStyle(
              fontSize:15,),),
                Text('Remember us'),
              ],
            ),
            
            Buttondsn(
              name:'LoginPage',
              color: Colors.green,
              textColor: Colors.white,
              size: 300,
              bordercolor: Colors.green,
              ),
              Buttondsn(
              name:'SignUp',
              color: Colors.white,
              textColor: Colors.green,
              size: 300,
              bordercolor: Colors.green,
              ),
          ],),
          ), 
          ),


      ],),
      
      
    );
  }
}