import 'package:flutter/material.dart';
import 'package:movie_app/common/HttpHandler.dart';
import 'package:movie_app/model/Media.dart';
import 'package:movie_app/media_list_item.dart';

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => new _MediaListState();
 }
class _MediaListState extends State<MediaList> {

  ///variables
  List<Media> _media = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovies();//cargar las peliculas
  }

  void loadMovies() async{
    var movies = await HttpHandler().fetchMovies(); // recibir las peliculas desde HttpHandler
    setState(() {
      _media.addAll(movies); 
    });
  }

  @override
  Widget build(BuildContext context) {
   return new Container(
     child: new ListView.builder(//visualizar en el app las peliculas obtenidas
       itemCount: _media.length,
       itemBuilder: (BuildContext context, int index){
             return new MediaListItem(_media[index]);
             //new Image.network(_media[index].getPosterUrl())//obtener la imagen del poster

       }
     ),
   );
  }
}