import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_list/models/google_signin.dart';
import 'package:watch_list/models/watchbox.dart';
import 'package:watch_list/screens/sign_up.dart';
import 'screens/movie_list.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();

    Hive.registerAdapter(WatchBoxAdapter());
    await Hive.openBox<WatchBox>('watchbox');

    await Firebase.initializeApp();

    runApp(WatchList());
}

class WatchList extends StatelessWidget {
    const WatchList({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        // return ChangeNotifierProvider(
        //     create: (context)=> GoogleSignInProvider(),
        //     child:
            return MaterialApp(
                title: "Watch List",
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primarySwatch: Colors.amber
                ),
                home: SafeArea(
                    child: MovieList()
                ),
            );
        // );
    }
}