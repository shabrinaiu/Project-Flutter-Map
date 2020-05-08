import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class LocationTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new FlutterMap(
            options: new MapOptions(
                center: new LatLng(35.22, -101.83), minZoom: 5.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(35.215, -101.825),
                    builder: (context) => new Container(
                          child: IconButton(
                            icon: Icon(Icons.location_on),
                            color: Colors.blue,
                            iconSize: 45.0,
                            onPressed: () {
                              print('Marker tapped');
                            },
                          ),
                        ))
              ])
            ]));
  }
}