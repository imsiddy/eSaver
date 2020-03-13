import 'package:flutter/material.dart';

class Lights extends StatefulWidget {
  Lights({Key key}) : super(key: key);

  @override
  _LightsState createState() => _LightsState();
}

class _LightsState extends State<Lights> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Main Screen")),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("data");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => null),
            );
          },
        ),
        body: Container(
          color: Color(0xfff5f5f5),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "716-A",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0),
                  child: Text(
                    "Lab",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Divider(
                indent: 25.0,
                endIndent: 25.0,
                thickness: 5.0,
                color: Colors.black,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.album, size: 50),
                          title: Text('Heart Shaker'),
                          subtitle: Text('TWICE'),
                          trailing: null,
                        ),
                      ],
                    ),
                  ),
              ),
              ListViewCard(),
            ],
          ),
        ),
      ),
    );
  }
}


class ListViewCard extends StatelessWidget {
  List<String> _listViewData = [
    "A List View with many Text - Here's one!",
    "A List View with many Text - Here's another!",
    "A List View with many Text - Here's more!",
    "A List View with many Text - Here's more!",
    "A List View with many Text - Here's more!",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            height: 250,
            child: Card(
              elevation: 3.0,
              child: ListView(
                padding: EdgeInsets.all(8.0),
                //map List of our data to the ListView
                children: _listViewData
                    .map((data) => ListTile(title: Text(data)))
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 250,
            child: Card(
              elevation: 3.0,
              child: ListView(
                padding: EdgeInsets.all(8.0),
                //map List of our data to the ListView
                children: _listViewData
                    .map((data) => ListTile(title: Text(data)))
                    .toList(),
              ),
            ),
          ),
        ],
    );
  }
}