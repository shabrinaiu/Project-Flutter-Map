import 'dart:async';
import 'dart:convert' show json;

import 'package:http/http.dart' as http;
import 'package:maptravo/models/models.dart';
import 'package:meta/meta.dart';

class TransformerClient {
  final _host = 'pantau-trafo.herokuapp.com';
  final _contextRoot = 'api';

  Future<List<Transformer>> fetchTransformers() async {
    final _path = 'trafo';
    final results = await request(path: _path);
    print("fetchTransformers");

    return results
        .map<Transformer>((json) => Transformer.fromJson(json))
        .toList(growable: false);
  }

  Future request(
      {@required String path, Map<String, String> parameters}) async {
    final uri = Uri.https(_host, '$_contextRoot/$path', parameters);
    final results = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Map<String, String> get _headers =>
      {'Accept': 'application/json'};
}