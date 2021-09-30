import 'dart:convert';

Coords coordsFromJson(String str) => Coords.fromJson(json.decode(str));

String coordsToJson(Coords data) => json.encode(data.toJson());

class Coords {
  Coords({
    this.topLLat,
    this.topLLong,
    this.btmRLat,
    this.btmRLong,
  });

  String topLLat;
  String topLLong;
  String btmRLat;
  String btmRLong;

  factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        topLLat: json["top_l_lat"],
        topLLong: json["top_l_long"],
        btmRLat: json["btm_r_lat"],
        btmRLong: json["btm_r_long"],
      );

  Map<String, dynamic> toJson() => {
        "top_l_lat": topLLat,
        "top_l_long": topLLong,
        "btm_r_lat": btmRLat,
        "btm_r_long": btmRLong,
      };
}
