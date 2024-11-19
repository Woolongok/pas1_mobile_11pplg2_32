// To parse this JSON data, do
//
//     final league = leagueFromMap(jsonString);

import 'dart:convert';

League leagueFromMap(String str) => League.fromMap(json.decode(str));

String leagueToMap(League data) => json.encode(data.toMap());

class League {
  List<Teams> teams;
  List<Map<String, String?>> league;

  League({required this.teams, required this.league});

  factory League.fromMap(Map<String, dynamic> json) => League(
        teams: json["teams"] == null
            ? []
            : List<Teams>.from(json["teams"]!.map((x) => Teams.fromMap(x))),
        league: List<Map<String, String?>>.from(json["teams"].map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
      );

  Map<String, dynamic> toMap() => {
        "teams": teams == null
            ? []
            : List<dynamic>.from(teams!.map((x) => x.toMap())),
        "teams": List<dynamic>.from(league.map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
      };
}

class Teams {
  String name;
  String picture;
  String description;

  Teams({required this.name, required this.picture, required this.description});

  factory Teams.fromMap(Map<String, dynamic> json) => Teams(
      name: json["strTeam"],
      picture: json["strBadge"],
      description: json["strDescriptionEN"]);

  Map<String, dynamic> toMap() =>
      {"strBadge": picture, "strTeam": name, "strDescriptionEN": description};
}
