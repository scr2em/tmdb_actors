import 'dart:convert';

Actor welcomeFromJson(String str) => Actor.fromJson(json.decode(str));

class Actor {
  final String name;
  final String profilePath;
  Actor({this.name, this.profilePath});

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        name: json['name'],
        profilePath: json['profile_path'],
      );
}
