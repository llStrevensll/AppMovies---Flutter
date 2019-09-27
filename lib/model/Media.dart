import 'package:movie_app/common/Util.dart';

class Media {//revisar documentacion de API themoviedb
  int id;
  double voteAverage;//promedio de votos
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;

  String getPosterUrl() => getMediumPictureUrl(posterPath);//funcion -> poster url 
  String getBackDropUrl() => getLargePictureUrl(posterPath);//funcion -> fondo url
  String getGenres() => getGenreValues(genreIds);//funcion -> obtener generos

  factory Media(Map jsonMap){//constructor factory -> facilita la creacion de objetos de diferentes tipos (peliculas tv)
    
    return new Media.deserialize(jsonMap);
  }

  Media.deserialize(Map json) ://desde el json se pasa a cada una de las propiedades especificadas
    id = json["id"].toInt(),
    voteAverage = json["vote_average"].toDouble(),
    title = json["title"],
    posterPath = json["poster_path"] ?? "",
    backdropPath = json["backdrop_path"] ?? "",
    overview = json["overview"],
    releaseDate = json["release_date"],
    genreIds = json["genre_ids"].toList();

  
}