import 'package:islami_c14_offline_sun/models/timings.dart';

import 'Date.dart';
import 'Meta.dart';

class Data {
  final Timings? timings;
  final Date? date;
  final Meta? meta;

  Data({
    this.timings,
    this.date,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      timings: json['timings'] != null ? Timings.fromJson(json['timings']) : null,
      date: json['date'] != null ? Date.fromJson(json['date']) : null,
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (timings != null) 'timings': timings!.toJson(),
      if (date != null) 'date': date!.toJson(),
      if (meta != null) 'meta': meta!.toJson(),
    };
  }

  /// نسخة نسخة محسنة للتصحيح / النسخ
  Data copyWith({
    Timings? timings,
    Date? date,
    Meta? meta,
  }) {
    return Data(
      timings: timings ?? this.timings,
      date: date ?? this.date,
      meta: meta ?? this.meta,
    );
  }

  @override
  String toString() {
    return 'Data(timings: $timings, date: $date, meta: $meta)';
  }
}
