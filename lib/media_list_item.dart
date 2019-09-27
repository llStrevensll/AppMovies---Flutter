import 'package:flutter/material.dart';
import 'package:movie_app/model/Media.dart';

class MediaListItem extends StatelessWidget {
  ///Variables
  final Media media; //media_list

  ///Constructor
  MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return new Card(//seccion donde se desplegara el poster
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Stack(//proporciona espacio para colocar mas elementos
              children: <Widget>[
                new FadeInImage.assetNetwork(//configuracion de los poster de la pelicula
                  placeholder: "aseets/placeholder.jpg",
                  image: media.getBackDropUrl(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  //height: 400,
                  fadeInDuration: new Duration(milliseconds: 40),
                ),
                new Positioned(//posicionar elemento
                  left: 0.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: Colors.grey[900].withOpacity(0.5),//opacidad
                    ),
                    constraints: new BoxConstraints.expand(
                      height: 55.0
                    ),
                  ),
                ),
                new Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 0.0,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          media.title,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                      new Container(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: new Text( 
                          media.getGenres(),
                          style: new TextStyle(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,// si supera el limite, coloca puntos suspensivos
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      
    );
  }
}