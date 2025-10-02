/// latitude : 30.0444196
/// longitude : 31.2357116

class Location {
  Location({
      this.latitude, 
      this.longitude,});

  Location.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}