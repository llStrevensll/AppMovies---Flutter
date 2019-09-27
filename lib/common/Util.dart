final String _imageUrlMedium = "https://image.tmdb.org/t/p/w300";
final String _imageUrlLarge = "https://image.tmdb.org/t/p/w500";

String getMediumPictureUrl(String path) => _imageUrlMedium + path;//imagen de la pelicula en especifico

String getLargePictureUrl(String path) => _imageUrlLarge + path;

Map<int, String> _genreMap = {
    28: 'Acccion',
    12: 'Aventura',
    16: 'Animación',
    35: 'Comedia',
    80: 'Crimen',
    99: 'Documental',
    18: 'Drama',
    10751: 'Familia',
    14: 'Fantasía',
    36: 'Historia',
    27: 'Horror',
    10402: 'Musica',
    9648: 'Misterio',
    10749: 'Romance',
    878: 'Ciencia ficción',
    10770: 'Pelicula de la Televisión',
    53: 'Suspenso',
    10752: 'Guerra',
    37: 'Oeste',
    10759: 'Acción & Aventura',
    10762: 'Infantil',
    10763: 'Noticias',
    10764: 'Realoties',
    10765: 'Sci-Fi & Fantasia',
    10766: 'Serial',
    10767: 'Conversación',
    10768: 'Guerra & Politica',
};

//Generar lista de los generos
List<String> genresToList(List<dynamic> genreIds) => 
  genreIds.map((id) => _genreMap[id]).toList();


//Separar todos los elementos de la lista por comas","
String getGenreValues(List<dynamic> genreIds){

  StringBuffer buffer = new StringBuffer();
  buffer.writeAll(genresToList(genreIds), ", ");
  return buffer.toString();
}