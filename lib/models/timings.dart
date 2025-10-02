class Timings {
  final String? fajr;
  final String? sunrise;
  final String? dhuhr;
  final String? asr;
  final String? sunset;
  final String? maghrib;
  final String? isha;
  final String? imsak;
  final String? midnight;
  final String? firstThird;
  final String? lastThird;

  Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstThird,
    this.lastThird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
    fajr: json['Fajr'],
    sunrise: json['Sunrise'],
    dhuhr: json['Dhuhr'],
    asr: json['Asr'],
    sunset: json['Sunset'],
    maghrib: json['Maghrib'],
    isha: json['Isha'],
    imsak: json['Imsak'],
    midnight: json['Midnight'],
    firstThird: json['Firstthird'],
    lastThird: json['Lastthird'],
  );

  Map<String, dynamic> toJson() => {
    "Fajr": fajr,
    "Sunrise": sunrise,
    "Dhuhr": dhuhr,
    "Asr": asr,
    "Sunset": sunset,
    "Maghrib": maghrib,
    "Isha": isha,
    "Imsak": imsak,
    "Midnight": midnight,
    "Firstthird": firstThird,
    "Lastthird": lastThird,
  };
}
