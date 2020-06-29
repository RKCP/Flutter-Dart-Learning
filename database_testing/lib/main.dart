import 'package:databasetesting/Animal.dart';
import 'package:databasetesting/DatabaseHelper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Database Practice'),
          backgroundColor: Colors.grey[850],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MyHomePage(),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Animal eagle = new Animal(id: 1, name: 'Eagle', color: 'Golden', legs: 2);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            color: Colors.green,
            child: Text('Insert Animal'),
            onPressed: () async {
              await DatabaseHelper.databaseInstance.insertRow({
                DatabaseHelper.columnName: 'Eagle',
                DatabaseHelper.columnColor: 'Golden',
                DatabaseHelper.columnLegs: 2,
              });
            },
          ),
        ),
        Expanded(
          child: FlatButton(
            color: Colors.blue,
            child: Text('Query Animals'),
            onPressed: () async {
              List<Map<String, dynamic>> queriedRows =
                  await DatabaseHelper.databaseInstance.queryAllRows();
              print(queriedRows);
            },
          ),
        ),
        Expanded(
          child: FlatButton(
            color: Colors.orange,
            child: Text('Delete Animal'),
            onPressed: () async {
              await DatabaseHelper.databaseInstance
                  .deleteRow(2); // place id in here of row you want to delete
            },
          ),
        ),
        Expanded(
          child: FlatButton(
            color: Colors.red,
            child: Text('Delete All Animals'),
            onPressed: () async {
              await DatabaseHelper.databaseInstance.deleteAllRows();
            },
          ),
        )
      ],
    );
  }
}
