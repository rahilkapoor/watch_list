import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:watch_list/models/watchbox.dart';
import 'package:watch_list/screens/boxes.dart';
import 'package:watch_list/screens/movie_edit.dart';
import 'movie_detail.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieList extends StatefulWidget {
    const MovieList({ Key? key }) : super(key: key);

    @override
    _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

    // @override
    // void dispose() {
    //     Hive.close();
    //     super.dispose();
    // }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                title: Center(child: Text("WATCH LIST")),
            ),

            body: ValueListenableBuilder<Box<WatchBox>>(
                valueListenable: Boxes.getWatchBoxes().listenable(),
                builder: (context, box, _){
                    final movieList = box.values.toList().cast<WatchBox>();

                    return getMovieList(movieList);
                }
            ),

            floatingActionButton: FloatingActionButton(
                onPressed: (){
                    // debugPrint("Add movie");
                    navigateToMovieDetail('Add Movie');
                },

                tooltip: 'Click To Add Movie',
                
                child: Icon(Icons.add),
            ),
        );
    }

    Widget getMovieList(List<WatchBox> movieList) {

        if (movieList.isEmpty) {
            return const Center(
                child: Text(
                    "Add Movies!",
                    style: TextStyle(fontSize: 20.0),
                ),
            );
        }

        return ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index){
                final movie = movieList[index];
                
                return Card(
                    color: Colors.purpleAccent,
                    elevation: 2.0,
                    child: ListTile(
                        
                        leading: CircleAvatar(
                            backgroundColor: Colors.purple,
                            
                            child: CachedNetworkImage(
                                imageUrl: movie.url,
                                imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                        colorFilter:
                                            ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                                    ),
                                ),
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                            ),

                        ),

                        title: Text(movie.title),

                        subtitle: Text("Director : ${movie.director}"),

                        trailing: GestureDetector(
                            
                            child:Icon(Icons.delete),
                            
                            onTap: (){movie.delete();},
                        ),

                        onTap: (){
                            // debugPrint("list tile Tapped!");
                            navigateToEditDetail(movie);
                        }
                    )
                );
            }
        );
    }

    void navigateToEditDetail(WatchBox movie){
        Navigator.push(context, MaterialPageRoute(builder: (context){
            return MovieEdit(movie);
        }));
    }

    void navigateToMovieDetail(String title){
        Navigator.push(context, MaterialPageRoute(builder: (context){
            return MovieDetail(title);
        }));
    }
}