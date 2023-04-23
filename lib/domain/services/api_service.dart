import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

import 'package:mapapp/domain/entity/car.dart';
import 'package:mapapp/domain/entity/model.dart';

class ApiService {
  final String url = 'https://georgia.togo-tech.cloud/api/v6/avaliableCars00';

  Future<List<Car>> getCars() async {
    List<Car> cars = [];
    dynamic jsonData;
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body)['cars'];
      } else {
        jsonData = json.decode(
          await rootBundle.loadString('assets/json/local.json'),
        )['cars'];
      }
      for (var carData in jsonData) {
        cars.add(
          Car(
            latitute: carData['lat'] + .0,
            longtitude: carData['lon'] + .0,
            id: carData['id'],
            gosnum: carData['gosnomer'],
            model: Model(
              id: carData['model']['id'],
              model: carData['model']['model'],
              brand: carData['model']['brand'],
            ),
            fuel: carData['fuel'],
            cruisingRange: carData['cruising_range'],
            cruisingTime: carData['cruising_time'],
            alerting: carData['alerting'],
            companyId: carData['company_id'],
          ),
        );
      }
    } catch (exception) {
      //ToDo: логирование ошибок
    }
    return cars;
  }
}
