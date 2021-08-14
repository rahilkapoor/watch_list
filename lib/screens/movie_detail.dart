import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MovieDetail extends StatefulWidget {
    String movieDetailTitle;
    // const MovieDetail({ Key? key }) : super(key: key);
    MovieDetail(this.movieDetailTitle);

    @override
    _MovieDetailState createState() => _MovieDetailState(this.movieDetailTitle);
}

class _MovieDetailState extends State<MovieDetail> {
    String movieDetailTitle;

    _MovieDetailState(this.movieDetailTitle);

    XFile? _moviePoster;
    final ImagePicker _picker = ImagePicker(); 

    TextEditingController titleController = TextEditingController();
    TextEditingController directorController = TextEditingController();

    @override
    Widget build(BuildContext context) {

        
        void takePic(ImageSource source) async {
            final pickedFile = await _picker.pickImage(
                source: source
            );

            setState(() {
                _moviePoster = pickedFile;
            });
        }

        Widget selectPoster() {
            return Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                
                padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0
                ),

                child: Column(
                    children: <Widget>[
                        Text("Choose Movie Poster"),
                        
                        Container(height: 10.0,),
                        
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                TextButton(
                                    onPressed: (){
                                        takePic(ImageSource.camera);
                                    },
                                    child: Icon(Icons.camera),
                                ),

                                TextButton(
                                    onPressed: (){
                                        takePic(ImageSource.gallery);
                                    },
                                    child: Icon(Icons.image),
                                ),
                            ],
                        )
                    ]
                )
            );
        }

        return Scaffold(
            appBar: AppBar(
                title: Text(movieDetailTitle),
            ),

            body: Padding(
                padding: EdgeInsets.only(top: 20.0),

                child: ListView(
                    children: <Widget>[

                        Center(
                            child: Stack(
                                children: <Widget>[
                                    CircleAvatar(
                                        radius: 80.0,
                                        // backgroundImage: _moviePoster == null
                                        //     ? AssetImage("assets/poster.jpg")
                                        //     : FileImage(File(_moviePoster.path)),
                                        
                                    ),

                                    Positioned(
                                        bottom: 20.0,
                                        right: 20.0,
                                        child: InkWell(
                                            onTap: (){
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: ((builder) => selectPoster()),
                                                );
                                            },

                                            child: Icon(
                                                Icons.camera_alt,
                                                size: 30.0,
                                                color: Colors.amber,
                                            ),

                                        ),

                                    )
                                ],
                            ),
                        ),

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