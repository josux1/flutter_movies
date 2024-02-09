import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_movies/ui/utils/utils.dart';
import 'package:latlong2/latlong.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  Place place = Place(title: 'México', latLong: LatLng(23.6, -102.5));
  final controller = MapController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FlutterMap(
            mapController: controller,
            options: MapOptions(
              initialCenter: place.latLong,
              initialZoom: 10,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
            ],
          ),

          //
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18)),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: size.height * 0.15,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(place.title, style: t.subtitle),
                  ElevatedButton(
                      onPressed: () => _randomPlace(),
                      child: Text('Random Place')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _randomPlace() {
    final _random = new Random();
    place = places[_random.nextInt(places.length)];
    controller.move(place.latLong, 10.2);
    setState(() {});
  }
}

class Place {
  Place({required this.title, required this.latLong});
  final String title;
  final LatLng latLong;
}

final places = [
  Place(title: 'Eifferl tower', latLong: LatLng(48.8, 2.29)),
  Place(title: 'Statue of Liberty', latLong: LatLng(40.6, -74.04)),
  Place(title: 'México', latLong: LatLng(23.6, -102.5)),
];
