import 'Hijri.dart';
import 'Gregorian.dart';

/// readable : "16 Jul 2024"
/// timestamp : "1721102400"
/// hijri : {"date":"10-01-1446","format":"DD-MM-YYYY","day":"10","weekday":{"en":"Al Thalaata","ar":"الثلاثاء"},"month":{"number":1,"en":"Muḥarram","ar":"مُحَرَّم","days":29},"year":"1446","designation":{"abbreviated":"AH","expanded":"Anno Hegirae"},"holidays":["Ashura","Urs of Shaykh Shamsuddin Habīb Allah ق","Urs of Shaykh Abū al‑Hassan al‑Kharqāni ق","Birth of Imam Rābbani Ahmad Al-Fāruqi As-Sirhindi ق"],"adjustedHolidays":[],"method":"HJCoSA"}
/// gregorian : {"date":"16-07-2024","format":"DD-MM-YYYY","day":"16","weekday":{"en":"Tuesday"},"month":{"number":7,"en":"July"},"year":"2024","designation":{"abbreviated":"AD","expanded":"Anno Domini"},"lunarSighting":false}

class Date {
  Date({
      this.readable, 
      this.timestamp, 
      this.hijri, 
      this.gregorian,});

  Date.fromJson(dynamic json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    hijri = json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null;
    gregorian = json['gregorian'] != null ? Gregorian.fromJson(json['gregorian']) : null;
  }
  String? readable;
  String? timestamp;
  Hijri? hijri;
  Gregorian? gregorian;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['readable'] = readable;
    map['timestamp'] = timestamp;
    if (hijri != null) {
      map['hijri'] = hijri?.toJson();
    }
    if (gregorian != null) {
      map['gregorian'] = gregorian?.toJson();
    }
    return map;
  }

}