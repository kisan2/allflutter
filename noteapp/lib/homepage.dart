import 'package:flutter/material.dart';
import 'edit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  //If a State's build method depends on an object that can itself change state
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          //used for navigating to new page
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Edit()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(5.0),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.yellow[200],
              child: ListTile(
                title: Text('title' + index.toString()),
                subtitle: Text('simplecontent'),
                
              ),
            );
          }),
    );
  }
}
