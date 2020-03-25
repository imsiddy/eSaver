import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Permissions extends StatefulWidget {
  final String location;
  Permissions(this.location);

  @override
  _PermissionsState createState() => _PermissionsState(this.location);
}

class _PermissionsState extends State<Permissions> {
  String location;
  String grantUserId = '17ce084';

  _PermissionsState(this.location);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Manage Permissions'),
        ),
        body: Container(
            margin: EdgeInsets.all(15.0),
            child: ListView(
              children: <Widget>[

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$location',
                    style: TextStyle(
                      fontSize: 22,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Container(
                  // margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.only(top: 10, bottom: 15),
                  color: Colors.white24,
                  child: TextFormField(
                    onChanged: (value) {
                      grantUserId = value;
                    },
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_add,
                        color: Colors.grey,
                        size: 22,
                      ),
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1)),
                      hintText: "Student ID",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      //labelStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                ),

                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    padding: EdgeInsets.all(7.0),
                    color: Colors.blue,
                    child: Text(
                      "Grant Permission",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {},
                  ),
                ),

              SizedBox(
                height: 30,
              ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Accessing',
                    style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.blue,
                  thickness: 5,
                ),

                ListView.builder(
                  physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.person, size: 25, color: Colors.grey.shade500,),
                            title: Text(
                              '17ce084',
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 25,
                                color: Colors.grey.shade500,
                              ),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey.shade700,
                          )
                        ],
                      );
                    }),

              ],
            )),
      ),
    );
  }
}
