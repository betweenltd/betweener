class LinkResponse {
  int? totalResults;
  List<Link>? results;

  LinkResponse.fromJson(Map<String, dynamic> json) {
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Link.fromJson(v));
      });
    }
  }
}

class Link {
  int? id;
  var voteAverage;
  String? title;
  String? posterPath;
  String? overview;
  String? releaseDate;

  Link.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteAverage = json['vote_average'];
    title = json['title'];
    posterPath = json['poster_path'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }
}
