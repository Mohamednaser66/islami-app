class Moshaf {
  final int? id;
  final String? name;
  final String? server;
  final int? surahTotal;
  final int? moshafType;
  final String? surahList;

  const Moshaf({
    this.id,
    this.name,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  factory Moshaf.fromJson(Map<String, dynamic> json) {
    return Moshaf(
      id: json['id'] as int?,
      name: json['name'] as String?,
      server: json['server'] as String?,
      surahTotal: json['surah_total'] as int?,
      moshafType: json['moshaf_type'] as int?,
      surahList: json['surah_list'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'server': server,
      'surah_total': surahTotal,
      'moshaf_type': moshafType,
      'surah_list': surahList,
    };
  }

  Moshaf copyWith({
    int? id,
    String? name,
    String? server,
    int? surahTotal,
    int? moshafType,
    String? surahList,
  }) {
    return Moshaf(
      id: id ?? this.id,
      name: name ?? this.name,
      server: server ?? this.server,
      surahTotal: surahTotal ?? this.surahTotal,
      moshafType: moshafType ?? this.moshafType,
      surahList: surahList ?? this.surahList,
    );
  }

  @override
  String toString() {
    return 'Moshaf(id: $id, name: $name, server: $server, surahTotal: $surahTotal, type: $moshafType)';
  }
}
