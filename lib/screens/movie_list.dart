import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:watch_list/models/watchbox.dart';
import 'package:watch_list/screens/boxes.dart';
import 'movie_detail.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MovieList extends StatefulWidget {
    const MovieList({ Key? key }) : super(key: key);

    @override
    _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
    int count = 0;
    late List<WatchBox> movieList;

    @override
    void dispose() {
        Hive.close();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                title: Text("Watch List"),
            ),

            body: ValueListenableBuilder<Box<WatchBox>>(
                valueListenable: Boxes.getWatchBoxes().listenable(),
                builder: (context, box, _){
                    movieList = box.values.toList().cast<WatchBox>();

                    if(movieList.length == 0) return Text("Noting");
                    return getMovieList(movieList);
                }
            ),

            floatingActionButton: FloatingActionButton(
                onPressed: (){
                    debugPrint("Add movie");
                    navigateToMovieDetail('Add Movie');
                },

                tooltip: 'To add Movie',
                
                child: Icon(Icons.add),
            ),
        );
    }

    ListView getMovieList(movieList) {

        return ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index){
                final movie = movieList[index];
                return Card(
                    color: Colors.greenAccent,
                    elevation: 2.0,
                    child: ListTile(
                        leading: CircleAvatar(
                            child: Image.network(movie.url),
                        ),

                        title: Text(movie.title),

                        subtitle: Text(movie.director),

                        trailing: GestureDetector(
                            child:Icon(
                                Icons.delete
                            ),
                            onTap: movie.delete(),
                        ),

                        onTap: (){
                            debugPrint("list tile Tapped!");
                            navigateToMovieDetail('Edit Movie');
                        }
                    )
                );
            }
        );
    }

    void navigateToMovieDetail(String title){
        Navigator.push(context, MaterialPageRoute(builder: (context){
            return MovieDetail(title);
        }));
    }
}