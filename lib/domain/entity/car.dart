import 'model.dart';

class Car {
  double latitute;
  double longtitude;
  int id;
  String gosnum;
  Model model;
  int fuel;
  int cruisingRange;
  int cruisingTime;
  bool alerting;
  int companyId;

  Car({
    required this.latitute,
    required this.longtitude,
    required this.id,
    required this.gosnum,
    required this.model,
    required this.fuel,
    required this.cruisingRange,
    required this.cruisingTime,
    required this.alerting,
    required this.companyId,
  });
}
