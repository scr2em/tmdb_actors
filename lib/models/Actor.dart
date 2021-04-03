import 'package:iti_actors/local_storage/db_helper.dart';

class Actor {
  final String name;
  final String profilePath;
  final String department;
  final double popularity;
  final int id;

  Actor(
      {this.name, this.profilePath, this.department, this.popularity, this.id});

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
      name: json['name'],
      profilePath: json['profile_path'],
      department: json['known_for_department'],
      popularity: json['popularity'].toDouble(),
      id: json['id']);

  Map<String, dynamic> toMap() {
    return {
      DbHelper.COLUMN_ID: id,
      DbHelper.COLUMN_NAME: name,
      DbHelper.COLUMN_IMG: profilePath,
      DbHelper.COLUMN_POPULARITY: popularity,
      DbHelper.COLUMN_DEPARTMENT: department
    };
  }

  factory Actor.fromDatabase(Map<String, dynamic> json) => Actor(
      id: json[DbHelper.COLUMN_ID],
      name: json[DbHelper.COLUMN_NAME],
      profilePath: json[DbHelper.COLUMN_IMG],
      popularity: json[DbHelper.COLUMN_POPULARITY],
      department: json[DbHelper.COLUMN_DEPARTMENT]);
}
