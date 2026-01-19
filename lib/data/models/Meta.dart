import 'Method.dart';
import 'Offset.dart';

/// latitude : 8.8888888
/// longitude : 7.7777777
/// timezone : "Africa/Cairo"
/// method : {"id":5,"name":"Egyptian General Authority of Survey","params":{"Fajr":19.5,"Isha":17.5},"location":{"latitude":30.0444196,"longitude":31.2357116}}
/// latitudeAdjustmentMethod : "ANGLE_BASED"
/// midnightMode : "STANDARD"
/// school : "STANDARD"
/// offset : {"Imsak":0,"Fajr":0,"Sunrise":0,"Dhuhr":0,"Asr":0,"Maghrib":0,"Sunset":0,"Isha":0,"Midnight":0}

class Meta {
  Meta({
      this.latitude, 
      this.longitude, 
      this.timezone, 
      this.method, 
      this.latitudeAdjustmentMethod, 
      this.midnightMode, 
      this.school, 
      this.offset,});

  Meta.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    method = json['method'] != null ? Method.fromJson(json['method']) : null;
    latitudeAdjustmentMethod = json['latitudeAdjustmentMethod'];
    midnightMode = json['midnightMode'];
    school = json['school'];
    offset = json['offset'] != null ? Offset.fromJson(json['offset']) : null;
  }
  double? latitude;
  double? longitude;
  String? timezone;
  Method? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  Offset? offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['timezone'] = timezone;
    if (method != null) {
      map['method'] = method?.toJson();
    }
    map['latitudeAdjustmentMethod'] = latitudeAdjustmentMethod;
    map['midnightMode'] = midnightMode;
    map['school'] = school;
    if (offset != null) {
      map['offset'] = offset?.toJson();
    }
    return map;
  }

}