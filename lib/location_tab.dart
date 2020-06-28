import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class LocationTab extends StatefulWidget {
  @override
  State<LocationTab> createState() => _LocationTabState();
}

class _LocationTabState extends State<LocationTab> {
  final TransformerRepository repository = TransformerRepository(
    transformerClient: TransformerClient(),
  );
  Future<List<Transformer>> futureTransformers;

  @override
  void initState() {
    super.initState();
    futureTransformers = repository.getTransformers();
  }

  List<Marker> _buildMarkers(List<Transformer> list) {
    List<Marker> markers = new List(list.length);
    for (int i = 0; i < list.length; i++) {
      var pos = list.elementAt(i);
      markers[i] = new Marker(
          width: 45.0,
          height: 45.0,
          point: pos.latLng,
          builder: (context) => new Container(
            child: IconButton(
              icon: Icon(Icons.location_on),
              color: Colors.blue,
              iconSize: 45.0,
              onPressed: () {
                print('Marker tapped on ' + pos.latLng.toString());
              },
            ),
          ));
    }
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transformer>>(
        future: futureTransformers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: new FlutterMap(
                  options: new MapOptions(
                      center: new LatLng(-7.2973631, 112.7254572),
                      minZoom: 13.0),
                  layers: [
                    new TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']),
                    new MarkerLayerOptions(
                        markers: _buildMarkers(snapshot.data))
                  ]),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
