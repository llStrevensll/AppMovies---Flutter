import 'dart:async'; //asincrono
import 'dart:convert'; //json
import 'package:http/http.dart' as http;
import 'package:movie_app/common/Constants.dart';
import 'package:movie_app/model/Media.dart';


class HttpHandler {

    ///Variables
    final String _baseUrl = "api.themoviedb.org";
    final String _lenguaje = "es-ES";

    //Tipo de dato dinamico -> generico
    Future<dynamic> getJson(Uri uri) async{//metodo asincrono
      http.Response response = await http.get(uri);//respuesta de la api
      return json.decode(response.body);//decode y to string retorna json
    }

    Future<List<Media>> fetchMovies(){//buscar peliculas  -> retorna lista de objetos Media
      var uri = new Uri.https(_baseUrl, "3/movie/popular",{//peliculas polulares
        'api_key' : API_KEY,
        'page' : "1",
        'language' : _lenguaje
      });

      return getJson(uri).then((data) => 
          data['results'].map<Media>(//Mapear a un objeto el resultado
            (item) => new Media(item)
          ).toList()
        );
    }
    
}
//.then((data) => data.toString());//then -> despues de recibir la respuesta la convierte en un string