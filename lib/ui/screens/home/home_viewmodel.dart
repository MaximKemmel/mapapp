import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapapp/core/injections/injection.dart';
import 'package:mapapp/domain/entity/car.dart';
import 'package:mapapp/domain/services/api_service.dart';
import 'package:mapapp/ui/theme/colors.dart';

class HomeViewmodel extends ChangeNotifier {
  final ApiService apiService = getIt<ApiService>();
  List<Marker> markers = [];
  int selectedMarker = -1;

  HomeViewmodel() {
    getCars();
  }

  void getCars() async {
    List<Car> apiData = await apiService.getCars();
    markers = _buildMarkers(apiData);
    notifyListeners();
  }

  List<Marker> _buildMarkers(List<Car> cars) {
    final markerList = <Marker>[];
    int count = cars.length > 50 ? 50 : cars.length;
    for (int i = 0; i < count; i++) {
      markerList.add(
        Marker(
          height: 55,
          width: 55,
          point: LatLng(cars[i].latitute, cars[i].longtitude),
          builder: (_) {
            return GestureDetector(
              onTap: () {
                selectedMarker = i;
                notifyListeners();
              },
              child: Container(
                padding: EdgeInsets.all(selectedMarker == i ? 5 : 10),
                child: Image.asset(
                  'assets/images/marker.png',
                  color:
                      selectedMarker == i ? selectedMarkerColor : markerColor,
                ),
              ),
            );
          },
        ),
      );
    }
    return markerList;
  }
}
