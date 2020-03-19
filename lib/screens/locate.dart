import 'package:flutter/material.dart';
import 'package:esaver/classes/Location.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class Locate extends StatefulWidget {
  Locate({Key key}) : super(key: key);

  @override
  _LocateState createState() => _LocateState();
}

bool _likeVisible1 = true;
bool _likeVisible2 = true;

Future<String> getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString('token').toString());
    return _prefs.getString('token').toString();
  }

Future<List<Location>> _getLocation() async{
  var response = await http.get(Uri.encodeFull('https://smartboi.herokuapp.com/api/user'), headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token 85e1212cb75147a0a316175b5ec22d4bb07da052',
      });

  var jsonData = json.decode(response.body)['locations'];

  List<Location> locations = [];

  for(var l in jsonData){
    Location locate = Location(l['id'], l['location_name'], l['incharge_name'], l['connections']);
    locations.add(locate);
  }

  print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  print(locations.length);

  return locations;


}

class _LocateState extends State<Locate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Main Screen")),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("data");
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => Lights()),
            // );
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
                            "Hello,",
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
                      child: Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(25.0),
                              ),
                            ),
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'Search your location',
                            suffixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.all(20),
                          ),
                          // validator: (String value) {
                          //   return value.contains('@')
                          //       ? 'Do not use the @ char.'
                          //       : null;
                          // },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Favorite",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                                          child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 10.0,
                        child: FutureBuilder(
                          future: _getLocation(),
                          builder: (BuildContext context, AsyncSnapshot snapshot){
                            if(snapshot.data == null){
                              return Container(
                                child: Center(
                                  child: Text('Loading...'),
                                ),
                              );
                            }
                            else{
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index){
                                return ListTile(
                              leading: Icon(Icons.album, size: 25),
                              title: Text(snapshot.data[index].location_name),
                              
                              trailing: IconButton(
                                icon: Icon(
                                  _likeVisible1
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _likeVisible1 ^= true;
                                  });
                                },
                              ),
                            );
                              });
                            }
                          }
                        
                        //  Column(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: <Widget>[
                        //     ListTile(
                        //       leading: Icon(Icons.album, size: 25),
                        //       title: Text('Heart Shaker'),
                        //       subtitle: Text('TWICE'),
                        //       trailing: IconButton(
                        //         icon: Icon(
                        //           _likeVisible1
                        //               ? Icons.check_box
                        //               : Icons.check_box_outline_blank,
                        //         ),
                        //         onPressed: () {
                        //           setState(() {
                        //             _likeVisible1 ^= true;
                        //           });
                        //         },
                        //       ),
                        //     ),
                            
                        //   ],
                        // ),
                      ),
                      
                      ),
                    )],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}