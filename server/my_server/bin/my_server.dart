import 'dart:io';
import 'dart:convert';

Future<void> main() async {
  final server = await createServer();
  print('Server started: ${server.address} port ${server.port}');
  await handleRequests(server);
}

Future<HttpServer> createServer() async {
  final address = InternetAddress.loopbackIPv4;
  const port = 4040;
  return await HttpServer.bind(address, port);
}

Future<void> handleRequests(HttpServer server) async {
  await for (HttpRequest request in server) {
    switch (request.method) {
      case 'GET':
        handleGet(request);
        break;
      case 'POST':
        handlePost(request);
        break;
      default:
      //handleDefault(request);
    }
  }
}

var myStringStorage = 'Hello from a Dart server';
void handleGet(HttpRequest request) {
  request.response
    ..write(myStringStorage)
    ..close();
}

Future<void> handlePost(HttpRequest request) async {
  myStringStorage = await utf8.decoder.bind(request).join();
  request.response
    ..write('Got it. Thanks.')
    ..close();
}
