import 'package:http/http.dart' as http;
import 'dart:convert';

//var url = 'http://127.0.0.1:5000/lat_lng/carbon';

Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}




// class TalkServer {
//   postData() async {
//     var response = http.post(Uri.parse(url),
//         body: {"latitude": 1.toString(), "longitude": 2.toString()});
//     print(' ----- server response is: ------ ');
//     print(response);
//     print(' -------------------------------- ');
//   }
// }
