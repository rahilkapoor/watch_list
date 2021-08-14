import 'package:flutter/material.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
    const MovieList({ Key? key }) : super(key: key);

    @override
    _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
    int count = 0;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Watch List"),
            ),

            body: getMovieList(),

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

    ListView getMovieList() {

        return ListView.builder(
            itemCount: count,
            itemBuilder: (BuildContext, int position){
                return Card(
                    color: Colors.greenAccent,
                    elevation: 2.0,
                    child: ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Colors.lightBlue,
                            child: Icon(Icons.keyboard_arrow_right)
                        ),

                        title: Text("Movie 1"),

                        subtitle: Text("Director 1"),

                        trailing: Icon(Icons.delete),

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