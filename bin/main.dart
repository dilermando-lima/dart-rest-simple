import 'dart:convert';

import 'package:api_backend_dart/model/sentence.dart';
import 'package:api_backend_dart/service/sentence_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

void main() async {
  var router = Router()
    ..get('/sentence', (r) async => ResponseH.jsonOk(await SentenceService().list()))
    ..get('/sentence/<id|[0-9]+>', (r, String id) async => ResponseH.jsonOk(await SentenceService().getById(int.parse(id))))
    ..post('/sentence', (r) async {
      final body = await r.readAsString();
      return ResponseH.jsonOk(await SentenceService().add(Sentence.fromJson(body)));
    })
    ..delete('/sentence/<id|[0-9]+>', (r, String id) async {
      await SentenceService().removeById(int.parse(id));
      return Response(204);
    });

  var handler = const Pipeline().addMiddleware(logRequests()).addHandler(router);

  io.serve(handler, 'localhost', 8080);
}

class ResponseH {
  static Response jsonOk(dynamic body) {
    dynamic response;

    if (body is Map) {
      response = body;
    } else if (body is List) {
      response = body.map((e) => e.toMap()).toList();
    } else {
      response = body.toMap();
    }

    return Response.ok(jsonEncode(response), headers: {'Content-type': 'application/json'}, encoding: Encoding.getByName("utf-8"));
  }
}
