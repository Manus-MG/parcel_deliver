import 'package:latlong2/latlong.dart';

import 'DeliveryWidget.dart';

const String GOOGLE_MAPS_API_KEY = "AIzaSyCWWt2iN04AAlJtD9t3nbUPCzagcNDGTBE";

// "AIzaSyDoiHMtuMr3S54z3nTeUZkIa-nCVDuDVAA";
class LocakionData {
  static double? latitude;
  static double? longitude;
  static LatLng _destinationloc = LatLng(latitude! , longitude!);
}

class initialUserLoc {
  static double? latitude;
  static double? longitude;
  static LatLng _initailuserLoc = LatLng(latitude! , longitude!);
}


class OrderManagement {
  static List<OrderDetails> allOrdersList = [];
}