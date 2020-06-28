import 'package:maptravo/models/models.dart';
import 'package:test/test.dart';
import 'package:maptravo/repositories/repositories.dart';

void main() {
  test('Testing Mapping Trafo Position API', () async {
    final client = TransformerClient();
    final result = (await client.fetchTransformers()).first;

    Map<String, dynamic> expectedResult = {
      "id": 1,
      "longitude": "-7.2574719",
      "latitude": "112.7520883",
      "detail": "Jl. Kebun Turi",
      "created_at": "2020-06-04 02:20:00",
      "updated_at": "2020-06-04 02:20:00"
    };

    expect(result.id, Transformer.fromJson(expectedResult).id);
  });
}
