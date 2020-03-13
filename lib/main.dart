import 'package:esever/Home.dart';
import 'package:esever/Light.dart';
import 'package:flutter/material.dart';
import 'package:search_widget/search_widget.dart';
import 'Light.dart';


void main() => runApp(Mainclass());

class Mainclass extends StatefulWidget {
  Mainclass({Key key}) : super(key: key);

  @override
  _MainclassState createState() => _MainclassState();
}

class _MainclassState extends State<Mainclass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: MyApp(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   MyApp({Key key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// bool _likeVisible1 = true;
// bool _likeVisible2 = true;

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: Text("Main Screen")),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           // onPressed: (){ 
//           //   Navigator.push(
//           //     context,
//           //     MaterialPageRoute(builder: (context) => Lights()));
//           //   },
//           onPressed: () {
//             print("data");
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SecondRoute()),
//             );
//           },
//         ),
//         body: Container(
//           color: Color(0xfff5f5f5),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         "Hi, Siddharth",
//                         style: TextStyle(fontSize: 50),
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         "Have a Nice Day",
//                         style: TextStyle(fontSize: 20),
//                       )),
//                 ),
//                 Divider(
//                   color: Colors.black,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 8.0, bottom: 8.0, left: 12.0, right: 12.0),
//                   child: Container(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: const BorderRadius.all(
//                             const Radius.circular(25.0),
//                           ),
//                         ),
//                         hintStyle: TextStyle(fontSize: 17),
//                         hintText: 'Search your trips',
//                         suffixIcon: Icon(Icons.search),
//                         contentPadding: EdgeInsets.all(20),
//                       ),
//                       validator: (String value) {
//                         return value.contains('@')
//                             ? 'Do not use the @ char.'
//                             : null;
//                       },
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       "Favorite",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 ),
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   elevation: 10.0,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       ListTile(
//                         leading: Icon(Icons.album, size: 50),
//                         title: Text('Heart Shaker'),
//                         subtitle: Text('TWICE'),
//                         trailing: IconButton(
//                           icon: Icon(
//                             _likeVisible1
//                                 ? Icons.check_box
//                                 : Icons.check_box_outline_blank,
//                             semanticLabel: _likeVisible1
//                                 ? 'hide password'
//                                 : 'show password',
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _likeVisible1 ^= true;
//                             });
//                           },
//                         ),
//                       ),
//                       // Padding(
//                       //   padding: const EdgeInsets.only(left:200.0),
//                       //   child: Divider(
//                       //     color: Colors.black,
//                       //   ),
//                       // ),
//                       ListTile(
//                         leading: Icon(Icons.album, size: 50),
//                         title: Text('Heart Shaker'),
//                         subtitle: Text('TWICE'),
//                         trailing: IconButton(
//                           icon: Icon(
//                             _likeVisible2
//                                 ? Icons.check_box
//                                 : Icons.check_box_outline_blank,
//                             semanticLabel: _likeVisible2
//                                 ? 'hide password'
//                                 : 'show password',
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _likeVisible2 ^= true;
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       "Favorite",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 ),
//                 Card(
//                   shape: RoundedRectangleBorder(  
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   elevation: 10.0,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       ListTile(
//                         leading: Icon(Icons.album, size: 50),
//                         title: Text('Heart Shaker'),
//                         subtitle: Text('TWICE'),
//                         trailing: IconButton(
//                           icon: Icon(
//                             _likeVisible1
//                                 ? Icons.check_box
//                                 : Icons.check_box_outline_blank,
//                             semanticLabel: _likeVisible1
//                                 ? 'hide password'
//                                 : 'show password',
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _likeVisible1 ^= true;
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second Route"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }