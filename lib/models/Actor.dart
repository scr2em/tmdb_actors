import 'dart:convert';

Actor welcomeFromJson(String str) => Actor.fromJson(json.decode(str));

class Actor {
  final String name;
  final String profilePath;
  final String department;
  final double popularity;

  Actor({this.name, this.profilePath, this.department, this.popularity});

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
      name: json['name'],
      profilePath: json['profile_path'],
      department: json['known_for_department'],
      popularity: json['popularity'].toDouble());
}
