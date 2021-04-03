class ActorDetail {
  final String name;
  final String profilePath;
  final String department;
  final double popularity;
  final int id;
  final String biography;
  final String birthDate;
  final String birthPlace;
  List<Image> modifiedImages;

  ActorDetail(
      {this.name,
      this.profilePath,
      this.department,
      this.popularity,
      this.id,
      this.biography,
      this.birthDate,
      this.birthPlace,
      this.modifiedImages});

  factory ActorDetail.fromJson(Map<String, dynamic> json) {
    return ActorDetail(
        name: json['name'],
        profilePath: json['profile_path'],
        department: json['known_for_department'],
        popularity: json['popularity'].toDouble(),
        id: json['id'],
        biography: json['biography'],
        birthDate: json['birthday'],
        birthPlace: json['place_of_birth']);
  }
}

class Image {
  final String imgPath;
  final double imgVote;

  Image({this.imgPath, this.imgVote});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imgPath: json['file_path'],
        imgVote: json['vote_average'],
      );
}
