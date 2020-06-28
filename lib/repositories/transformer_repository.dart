import 'dart:async';

import 'package:meta/meta.dart';

import 'package:maptravo/models/models.dart';
import 'package:maptravo/repositories/transformer_client.dart';

class TransformerRepository {
  final TransformerClient transformerClient;

  TransformerRepository({@required this.transformerClient})
      : assert(transformerClient != null);

  Future<List<Transformer>> getTransformers() async {
    return transformerClient.fetchTransformers();
  }
}
