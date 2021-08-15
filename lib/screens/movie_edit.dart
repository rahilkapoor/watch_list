import 'package:flutter/material.dart';
import 'package:watch_list/models/watchbox.dart';
import 'package:watch_list/screens/boxes.dart';

import 'package:cached_network_image/cached_network_image.dart';


class MovieEdit extends StatefulWidget {
    WatchBox MovieEditCurr;
    MovieEdit(this.MovieEditCurr);

    @override
    _MovieEditState createState() => _MovieEditState(this.MovieEditCurr);
}

class _MovieEditState extends State<MovieEdit> {
    WatchBox MovieEditCurr;

    _MovieEditState(this.MovieEditCurr);


    TextEditingController urlController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    TextEditingController directorController = TextEditingController();

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                title: Text("Edit Movie"),
            ),

            body: Padding(
                padding: EdgeInsets.only(top: 20.0),

                child: ListView(
                    children: <Widget>[

                        CircleAvatar(
                            backgroundColor: Colors.amberAccent,
                            radius: 80.0,
                            child: CachedNetworkImage(
                                imageUrl: MovieEditCurr.url,
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
                                errorWidget: (context, url, error) => Icon(Icons.error,size: 90.0,),
                            ),
                        ),

                        Center(
                            child:Column(
                                children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                                        child: Text(
                                            MovieEditCurr.title,
                                            style: TextStyle(fontSize: 20.0),
                                        )

                                    ),

                                    Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(MovieEditCurr.director)

                                    ),
                                ],
                            )
                        ),

                        

                        Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                            child: TextField(
                                controller: urlController,
                                // onChanged: (value){
                                //     debugPrint("URL Changed!");
                                // },

                                decoration: InputDecoration(
                                    labelText: 'Edit URL',
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
                                    labelText: 'Edit Movie Name',
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
                                    labelText: 'Edit Director Name',
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
                                            onPressed: () async{
                                                if(titleController.text.length != 0)
                                                    MovieEditCurr.title = titleController.text;
                                                if(directorController.text.length != 0)
                                                    MovieEditCurr.director = directorController.text;
                                                if(urlController.text.length != 0)
                                                    MovieEditCurr.url = urlController.text;
                                                MovieEditCurr.save();
                                                Navigator.pop(context);
                                            },
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