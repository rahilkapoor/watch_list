import 'package:flutter/material.dart';
import 'screens/movie_list.dart';
import 'screens/movie_detail.dart';

void main() {
    runApp(WatchList());
}

class WatchList extends StatelessWidget {
    const WatchList({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'WatchList',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.amber
            ),
            home: MovieDetail()
        );
    }
}