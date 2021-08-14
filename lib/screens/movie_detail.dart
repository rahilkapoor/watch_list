import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
    const MovieDetail({ Key? key }) : super(key: key);

    @override
    _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {

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
                        Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                            child: TextField(
                                controller: titleController,
                                onChanged: (value){
                                    debugPrint("Movie Changed!");
                                },

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
                                onChanged: (value){
                                    debugPrint("director Changed!");
                                },

                                decoration: InputDecoration(
                                    labelText: 'Director Name',
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
                                            onPressed: (){
                                                debugPrint("Saved!");
                                            },
                                        )
                                    ),

                                    Container(width: 5.0),

                                    Expanded(
                                        child: ElevatedButton(
                                            child: Text("Delete"),
                                            onPressed: (){
                                                debugPrint("Delete!");
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