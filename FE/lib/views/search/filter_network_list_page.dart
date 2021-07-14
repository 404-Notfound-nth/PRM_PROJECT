import 'dart:async';

import 'package:clinicbookingapp/views/reserve/reserve.dart';
import 'package:clinicbookingapp/views/search/dental.dart';
import 'package:clinicbookingapp/views/search/dentals_api.dart';
import 'package:clinicbookingapp/views/search/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' show cos, sqrt, asin;

//not use
class FilterNetworkListPage extends StatefulWidget {
  @override
  FilterNetworkListPageState createState() => FilterNetworkListPageState();
}

class FilterNetworkListPageState extends State<FilterNetworkListPage> {
  //List<Book> books = [];
  List<Dental> dentals = [];
  Dental dental;
  String query = '';
  Timer debouncer;
  Position _currentPosition;
  String _currentAddress = '';

  String _startAddress = '';
  String _placeDistance;
  bool isVisi = false;
  String address;

  @override
  void initState() {
    super.initState();
    asyncMethod();
    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    //final books = await BooksApi.getBooks(query);

    final dentals = await DentalsApi.getDentals(query);
    //setState(() => this.books = books);
    setState(() => this.dentals = dentals);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: dentals.length,
              itemBuilder: (context, index) {
                final dental = dentals[index];

                return //buildBook(book);
                    buildDental(dental, context, size);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Địa chỉ hoặc tên nha khoa',
        onChanged: searchDental,
      );

  Future searchDental(String query) async => debounce(() async {
        final dentals = await DentalsApi.getDentals(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.dentals = dentals;
        });
      });

  //==> phương thức tính toán là _calculateDistance á
  // Method for calculating the distance between two places
  Future<bool> calculateDistance(String address) async {
    try {
      // Retrieving placemarks from addresses
      List<Location> startPlacemark = await locationFromAddress(_startAddress);
      List<Location> destinationPlacemark = await locationFromAddress(address);

      // Storing latitude & longitude of start and destination location
      double startLatitude = startPlacemark[0].latitude;
      double startLongitude = startPlacemark[0].longitude;
      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;

      //print(startPlacemark.toString());
      // print(destinationPlacemark.toString());
      String totalDistance = _coordinateDistance(startLatitude, startLongitude,
              destinationLatitude, destinationLongitude)
          .toStringAsFixed(2);
      // print(totalDistance);
      setState(() {
        _placeDistance = totalDistance;
        //  print(_placeDistance);
      });
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  //tinh khoang cach 2 diem theo duong chim bay
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Method for retrieving the current location
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        //print('CURRENT POS: $_currentPosition');
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.street}, ${place.administrativeArea}, ${place.country}";
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  void asyncMethod() async {
    await _getCurrentLocation();
    await calculateDistance(dental.addressDental);
  }

  Widget buildDental(Dental dental, BuildContext context, Size size) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dental.nameDental,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Địa chỉ : ' + dental.addressDental,
            ),
            SizedBox(
              height: 4,
            ),
            // Visibility(
            //   visible: _placeDistance == null ? false : true,
            //   child: Text('Khoảng cách : $_placeDistance km'),
            // ),
            Text(
              'Khoảng cách : $_placeDistance km',
            ),
            SizedBox(
              height: 4,
            ),
            _cardRating(dental.rating),
            SizedBox(
              height: 4,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReserveScreen()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      width: size.width * 0.4,
                      decoration: new BoxDecoration(
                          //color: Colors.blue,
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: new LinearGradient(colors: [
                            Color(0xFF007AFF),
                            Color(0xFF3E3EF4)
                            // Color.fromARGB(255, 255, 136, 34),
                            // Color.fromARGB(255, 255, 177, 41)
                          ])),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Chi Tiết",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

RatingBar _cardRating(double totalRating) {
  return RatingBar.builder(
    initialRating: totalRating,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemSize: 20,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (value) {},
  );
}
