import 'package:flutter/material.dart';
import 'Location.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'api_response.dart';
import 'connect.dart';
import 'user.dart';

class Lights extends StatefulWidget {
  final int id;
  final String location;

  Lights(this.id, this.location);

  @override
  _LightsState createState() => _LightsState(this.id, this.location);
}


bool _likeVisible1 = true;
bool _likeVisible2 = true;
List<User> grantedUsers;

class _LightsState extends State<Lights> {
  int id;
  String location;
  String grantUserId = '17ce084';

  _LightsState(this.id, this.location);

  Future<List<Connection>> _getUsers() async {
    var response = await http.get(
        Uri.encodeFull('https://smartboi.herokuapp.com/api/location/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token 952c3f823d3c9926885490ddd825a11646832f73',
        });

    var jsonData = json.decode(response.body)['connections'];
    print(jsonData);

    List<Connection> connections = [];

    for (var u in jsonData) {
      Connection connection = Connection( u['id'], u['connection_name'], u['connection_pin'], u['is_high']);
      connections.add(connection);
    }
    return connections;
  }

  _updateAlbum(int id, bool item) async {
  var response = await http.put(
    'https://smartboi.herokuapp.com/api/connection/$id',
    headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token 952c3f823d3c9926885490ddd825a11646832f73',
        },
    body: 'is_high',
    );

  // if (response.statusCode == 200) {
  //   // If the server did return a 200 OK response,
  //   // then parse the JSON.
  //   return Album.fromJson(json.decode(response.body));
  // } else {
  //   // If the server did not return a 200 OK response,
  //   // then throw an exception.
  //   throw Exception('Failed to update album.');
  // }
}

updateNote(int id, bool item) async {
  String jsonData = '{"users": "is_high": $item}';
    var response = await  http.put('https://smartboi.herokuapp.com/api/connection/$id' , headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token 952c3f823d3c9926885490ddd825a11646832f73',
        }, body: json.encode(jsonData));
    //     .then((data) 
    //     {
    //   if (data.statusCode == 204) {
    //     return APIResponse<bool>(data: true);
    //   }
    //   return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    // },)
    // .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Main")),
        body: Container(
          color: Color(0xfff5f5f5),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9.0),
                    child: Text(
                      "Location : ",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      location,
                      style: TextStyle(fontSize: 50),
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
                  padding: EdgeInsets.only(top: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10.0,
                    child: FutureBuilder(
                        future: _getUsers(),
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
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  // print(snapshot.data[index].connection_name);
                                  // print(snapshot.data[index].is_high);
                                  // print(index);
                                  // print(snapshot.data[index].id);

                                  return Column(
                                    children: <Widget>[
                                      ListTile(
                                        leading: Icon(Icons.album, size: 25),
                                        title: Text(snapshot
                                            .data[index].connection_name),
                                        trailing: Switch(
                                          value: snapshot.data[index].is_high,
                                          onChanged: (value) {
                                            print(snapshot.data[index].is_high);
                                            print(value);
                                            print("data must be here");
                                            setState(
                                              () {
                                                 value = snapshot.data[ index].is_high;
                                                 _updateAlbum(snapshot.data[index].id, value);
                                                //  _likeVisible1 = value;
                                              },
                                            );
                                            print(value);
                                            print(snapshot.data[index].is_high);
                                            print("data be here");
                                          },
                                          activeTrackColor:
                                              Colors.lightGreenAccent,
                                          activeColor: Colors.green,
                                        ),
                                      ),
                                      Divider(
                                        height: 1,
                                        color: Colors.grey.shade700,
                                      )
                                    ],
                                  );
                                });
                          }
                        }),
                  ),
                ),
                // DisplayListView(), //data in static form if user want to fed input locally
                // ListViewExample(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: DisplayListView(),
    );
  }
}

class ListViewModel {
  final String title;
  final String subtitle;
  final String avatarURL;

  ListViewModel({this.title, this.subtitle, this.avatarURL});
}

List listViewData = [
  ListViewModel(
    title: "Group",
    subtitle: "Group Category",
    avatarURL: "1",
  ),
  ListViewModel(
    title: "Group",
    subtitle: "Group Category",
    avatarURL: "2",
  ),
  ListViewModel(
    title: "Group",
    subtitle: "Group Category",
    avatarURL: "3",
  ),
  ListViewModel(
    title: "Group",
    subtitle: "Group Category",
    avatarURL: "4",
  ),
  ListViewModel(
    title: "Group",
    subtitle: "Group Category",
    avatarURL: "5",
  ),
  ListViewModel(
    title: "Group",
    subtitle: "Group Category",
    avatarURL: "6",
  ),
  ListViewModel(
    title: "Group",
    subtitle: "Group Category",
    avatarURL: "7",
  ),
  ListViewModel(
    title: "Group",
    subtitle: "Group Category",
    avatarURL: "8",
  ),
  ListViewModel(
    title: "Group",
    subtitle: "Group Category",
    avatarURL: "9",
  ),
  ListViewModel(
    title: "Group",
    subtitle: "Group Category",
    avatarURL: "10",
  ),
];

class DisplayListView extends StatefulWidget {
  @override
  _DisplayListViewState createState() => _DisplayListViewState();
}

class _DisplayListViewState extends State {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: listViewData.length,
      itemBuilder: (context, int i) => Column(
        children: [
          new ListTile(
            leading: new CircleAvatar(child: Text(listViewData[i].avatarURL)),
            title: new Text(listViewData[i].title),
            subtitle: new Text(listViewData[i].subtitle),
            onTap: () {},
            onLongPress: () {
              print(
                Text("Long Pressed"),
              );
            },
          ),
        ],
      ),
    );
  }
}
