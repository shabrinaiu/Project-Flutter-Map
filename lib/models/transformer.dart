import 'package:latlong/latlong.dart';

class Transformer {
  final int id;
  // TODO: Reverse longitude and latitude from API
  final String longitude;
  final String latitude;
  final String detail;
  final String createdAt;
  final String updatedAt;

  LatLng get latLng =>
      new LatLng(double.parse(latitude), double.parse(longitude));

  Transformer.fromJson(Map json)
      : id = json['id'],
        longitude = json['latitude'],
        latitude = json['longitude'],
        detail = json['detail'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];
}
