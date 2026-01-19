import 'Params.dart';
import 'Location.dart';

/// id : 5
/// name : "Egyptian General Authority of Survey"
/// params : {"Fajr":19.5,"Isha":17.5}
/// location : {"latitude":30.0444196,"longitude":31.2357116}

class Method {
  Method({
      this.id, 
      this.name, 
      this.params, 
      this.location,});

  Method.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    params = json['params'] != null ? Params.fromJson(json['params']) : null;
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
  int? id;
  String? name;
  Params? params;
  Location? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (params != null) {
      map['params'] = params?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    return map;
  }

}