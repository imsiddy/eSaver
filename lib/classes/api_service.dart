import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String url = "https://smartboi.herokuapp.com/api/user";

  static Future<String> getList(String token) async {
    try {
      final response =
          await http.get(Uri.encodeFull(url), headers: {
        'Authorization': 'Token $token'
      });
      print(response.body);
        return (response.body.toString());
      
    } catch (ex) {
      return null;
    }
  }

  static Future<dynamic> loginPost(Map<String, String> loginCred) async {
    try {
      final response = await http.post(
        Uri.encodeFull('https://smartboi.herokuapp.com/api/login'),
        body: jsonEncode(loginCred),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.contains('token')) {
        print(response.body);
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs?.setBool("isLoggedIn", true);
        return (json.decode(response.body)['token']);
      } else {
        print('Invalid Cred');
        return 'Error';
      }
    } catch (e) {
      print('No Internet');
      return null;
    }
  }

//   static Future<bool> registerPost(Map<String, dynamic> userinfo) async {
//     try {
//       final response = await http.post(
//         Uri.encodeFull('${Urls.BASE_API_URL}userinfo'),
//         body: jsonEncode(userinfo),
//         headers: {
//           "key":
//               "mongodb+srv://change_bharuch:Developers_19@cluster0-lpmxb.mongodb.net/test?retryWrites=true&w=majority",
//           'Content-Type': 'application/json'
//         },
//       );
//       return response.statusCode == 201;
//     } catch (e) {
//       return false;
//     }
//   }

//  static Future<bool> articlePost(Map<String, dynamic> article) async {
//     try {
//       final response = await http.post(
//         Uri.encodeFull('${Urls.BASE_API_URL}artchild'),
//         body: jsonEncode(article),
//         headers: {
//           "key":
//               "mongodb+srv://change_bharuch:Developers_19@cluster0-lpmxb.mongodb.net/test?retryWrites=true&w=majority",
//           'Content-Type': 'application/json'
//         },
//       );
//       return response.statusCode == 201;
//     } catch (e) {
//       return false;
//     }
//   }

//   static Future<bool> experiencePost(Map<String, dynamic> experience) async {
//     try {
//       final response = await http.post(
//         Uri.encodeFull('${Urls.BASE_API_URL}artvolunteer'),
//         body: jsonEncode(experience),
//         headers: {
//           "key":
//               "mongodb+srv://change_bharuch:Developers_19@cluster0-lpmxb.mongodb.net/test?retryWrites=true&w=majority",
//           'Content-Type': 'application/json'
//         },
//       );
//       return response.statusCode == 201;
//     } catch (e) {
//       return false;
//     }
//   }
}
