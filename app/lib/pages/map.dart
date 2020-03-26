import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:search_map_place/search_map_place.dart';


class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _mapController = Completer();
  final Set<Marker> _markers = {};
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  LatLng _lastMapPosition = _center;
  var gravarLocal; 
  

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(-20.3000, -40.2990),
    zoom: 14.0000,
  );

  void _onAddMarkerButtonPressed(LatLng _lastMapPosition)async {
    setState(() {
     
    
      _markers.add(Marker(
          
          //This marker id can be anything thatuniquely indentifies each marker
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            
            onTap:  () {
              _showDialog();
            },
            title: gravarLocal,
            snippet: 'My City',
          ),
          onTap: () {

            _showDialog();
          }));
    });
  }

  void _showDialog() async {
    var response = await http.get(
        'http://samples.openweathermap.org/data/2.5/weather?q=fortaleza,PK&appid=583ce0b48d19c097e165f76cf70b6b10');

    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text(jsonResponse['main']['temp'].toString()),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onTap: _onAddMarkerButtonPressed,
            onCameraMove: _onCameraMove,
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: _initialCamera,
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
            },
          ),
          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width * 0.05,
            // width: MediaQuery.of(context).size.width * 0.9,
            child: SearchMapPlaceWidget(
              apiKey: "AIzaSyAuHQ8wC27BdbY02nAUCpWqBEuI4unTmD8",
              location: _initialCamera.target,
              radius: 30000,
              onSelected: (place) async {
                final geolocation = await place.geolocation;
              
               
                gravarLocal =  geolocation.fullJSON['address_components'][0]['long_name'];
               
                final GoogleMapController controller =
                    await _mapController.future;

                controller.animateCamera(
                    CameraUpdate.newLatLng(geolocation.coordinates));
                controller.animateCamera(
                    CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('Approve'),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
