// import 'package:esever/Light.dart';
import 'package:esever/lights.dart';
import 'package:flutter/material.dart';
import 'Location.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

bool _likeVisible1 = true;
bool _likeVisible2 = true;

class _MyAppState extends State<MyApp> {
  Future<List<Location>> _getLocation() async {
    print('----------------------------');
    var response = await http.get(
        Uri.encodeFull('https://smartboi.herokuapp.com/api/user'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token 952c3f823d3c9926885490ddd825a11646832f73',
        });

    var jsonData = json.decode(response.body)['locations'];

    List<Location> locations = [];

    for (var l in jsonData) {
      Location locate = Location(
          l['id'], l['location_name'], l['incharge_name'], l['connections']);
      locations.add(locate);
    }
    return locations;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Main Screen")),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("data");
          },
        ),
        body: ListView(
          children: <Widget>[
            Container(
              color: Color(0xfff5f5f5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Hi, Siddharth",
                            style: TextStyle(fontSize: 50),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Have a Nice Day",
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 12.0, right: 12.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      elevation: 10.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(25.0),
                              ),
                            ),
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'Search your trips',
                            suffixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.all(20),
                          ),
                          validator: (String value) {
                            return value.contains('@')
                                ? 'Do not use the @ char.'
                                : null;
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Location",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10.0,
                      child: FutureBuilder(
                        future: _getLocation(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return Container(
                              child: Center(
                                child: Text('Loading...'),
                              ),
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Lights(
                                            snapshot.data[index].id,
                                            snapshot.data[index].location_name),
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    leading: Icon(Icons.computer, size: 25),
                                    title: Text(
                                        snapshot.data[index].location_name),
                                    trailing: Icon(Icons.chevron_right),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
