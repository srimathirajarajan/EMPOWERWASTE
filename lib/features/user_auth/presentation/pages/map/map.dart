// ignore_for_file: unnecessary_new, avoid_print, prefer_const_constructors, prefer_final_fields, prefer_collection_literals, unnecessary_import, use_key_in_widget_constructors

import 'dart:async';

import 'package:geolocator/geolocator.dart'; // Add geolocator package
import 'package:bootcamp/features/user_auth/presentation/pages/map/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polygonLatLngs = <LatLng>[];

  int _polygonIdCounter = 1;
  int _polylineIdCounter = 1;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Fetch current location on widget initialization
    _setMarker(LatLng(37.42796133580664, -122.085749655962), 'origin');
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _updateMarker(position.latitude, position.longitude, 'current_location');
    } catch (e) {
      print("Error: $e");
    }
  }

  void _setMarker(LatLng point, String markerIdVal) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(markerIdVal),
          position: point,
          icon: markerIdVal == 'origin'
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
              : BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
        ),
      );
    });
  }

  void _setPolygon() {
    final String polygonIdVal = 'polygon_$_polygonIdCounter';
    _polygonIdCounter++;

    _polygons.add(
      Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: polygonLatLngs,
        strokeWidth: 2,
        fillColor: Colors.transparent,
      ),
    );
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$_polylineIdCounter';
    _polylineIdCounter++;

    _polylines.add(
      Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 2,
        color: Colors.black,
        points: points
            .map(
              (point) => LatLng(point.latitude, point.longitude),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _originController,
                      decoration: InputDecoration(hintText: ' Origin'),
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                    TextFormField(
                      controller: _destinationController,
                      decoration: InputDecoration(hintText: ' Destination'),
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () async {
                  var directions = await LocationService().getDirections(
                    _originController.text,
                    _destinationController.text,
                  );
                  _goToPlace(
                    directions['start_location']['lat'],
                    directions['start_location']['lng'],
                    directions['bounds_ne'],
                    directions['bounds_sw'],
                    'origin',
                  );

                  _goToPlace(
                    directions['end_location']['lat'],
                    directions['end_location']['lng'],
                    directions['bounds_ne'],
                    directions['bounds_sw'],
                    'destination',
                  );

                  _setPolyline(directions['polyline_decoded']);
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: _markers,
              polygons: _polygons,
              polylines: _polylines,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onTap: (point) {
                setState(() {
                  polygonLatLngs.add(point);
                  _setPolygon();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToPlace(
    double lat,
    double lng,
    Map<String, dynamic> boundsNe,
    Map<String, dynamic> boundsSw,
    String markerIdVal,
  ) async {
    final GoogleMapController controller = await _controller.future;

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(markerIdVal),
          position: LatLng(lat, lng),
          icon: markerIdVal == 'Destination'
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
              : BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
        ),
      );
    });

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );

    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
            northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
          ),
          25),
    );
    _setMarker(LatLng(lat, lng), markerIdVal);
  }

  void _updateMarker(double lat, double lng, String markerIdVal) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(markerIdVal),
          position: LatLng(lat, lng),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    });
  }
}
