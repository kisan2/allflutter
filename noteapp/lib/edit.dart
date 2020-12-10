import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {



  @override

  //If a State's build method depends on an object that can itself change state
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(

        title: Text('New'),
      ),
      body: ListView(
        padding: EdgeInsets.all(13),
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'new Tittle',
                border: OutlineInputBorder(
                  ),

              ),
              
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            
            decoration: InputDecoration(
              
              hintText: 'simple notes',
              border: OutlineInputBorder(
                ),

            ),
            
          )
        ],
      ),
    );
  }
}