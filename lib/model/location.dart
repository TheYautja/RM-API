import "character.dart";

class LocationResponse {
  Info info;
  List<Location> result;

  LocationResponse({
    required this.info,
    required this.result,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) {
    return LocationResponse(
      info: Info.fromJson(json["info"]),
      result: List<Location>.from(
        json["results"].map(
          (x) => Location.fromJson(x),
        ),
      ),
    );
  }
}

class Location {
  int id;
  String name;
  String type;
  String dimension;
  List residents;
  String url;
  String created;

  Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    this.residents = const [],
    required this.url,
    required this.created,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json["id"],
      name: json["name"],
      type: json["type"],
      dimension: json["dimension"],
      residents: json["residents"],
      url: json["url"],
      created: json["created"],
    );
  }
}
