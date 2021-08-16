import 'package:flutter/material.dart';
import 'package:watch_list/models/watchbox.dart';
import 'package:watch_list/screens/boxes.dart';


class MovieDetail extends StatefulWidget {
    String movieDetailTitle;
    MovieDetail(this.movieDetailTitle);

    @override
    _MovieDetailState createState() => _MovieDetailState(this.movieDetailTitle);
}

class _MovieDetailState extends State<MovieDetail> {
    String movieDetailTitle;

    _MovieDetailState(this.movieDetailTitle);


    TextEditingController urlController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    TextEditingController directorController = TextEditingController();
    bool validate = false;

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                title: Text(movieDetailTitle),
            ),

            body: Padding(
                padding: EdgeInsets.only(top: 20.0),

                child: ListView(
                    children: <Widget>[

                        Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                            child: TextField(
                                controller: urlController,
                                // onChanged: (value){
                                //     debugPrint("URL Changed!");
                                // },

                                decoration: InputDecoration(
                                    labelText: 'Poster URL',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0)
                                    )
                                ),

                            )

                        ),

                        Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                            child: TextField(
                                controller: titleController,
                                // onChanged: (value){
                                //     debugPrint("Movie Changed!");
                                // },
                                

                                decoration: InputDecoration(
                                    labelText: 'Movie Name',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0)
                                    )
                                ),

                            )

                        ),

                        Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                            child: TextField(
                                controller: directorController,
                                // onChanged: (value){
                                //     debugPrint("director Changed!");
                                // },

                                decoration: InputDecoration(
                                    labelText: 'Director of the Movie',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0)
                                    )
                                ),

                            )

                        ),

                        Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                            
                            child: Row(
                                children: <Widget>[
                                    Expanded(
                                        child: ElevatedButton(
                                            child: Text("Save"),
                                            // onPressed: () async{
                                            //     int i = await DatabaseHelper.instance.insert({
                                            //         DatabaseHelper.columnTitle : titleController.text,
                                            //         DatabaseHelper.columnUrl : urlController.text,
                                            //         DatabaseHelper.columnDirector : directorController.text
                                            //     });
                                            //     debugPrint('Movie Inserted in $i');
                                            // },
                                            onPressed: () async{
                                                if(titleController.text.trim().length == 0) return null;
                                                final watchbox = WatchBox()
                                                ..title = titleController.text
                                                ..url = urlController.text
                                                ..director = directorController.text;

                                                final box = Boxes.getWatchBoxes();
                                                box.add(watchbox);
                                                Navigator.pop(context);
                                            }
                                        )
                                    ),

                                    Container(width: 5.0),

                                    Expanded(
                                        child: ElevatedButton(
                                            child: Text("Cancel"),
                                            onPressed: (){
                                                Navigator.pop(context);
                                            },
                                        )
                                    )

                                ]
                            )
                        
                        )

                    ]
                )

            ),

        );
    }
}