import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:watch_list/models/movies.dart';

class DatabaseHelper{
    static DatabaseHelper _databaseHelper;
    

    DatabaseHelper._createInstance();

    factory DatabaseHelper(){
        if(_databaseHelper == null){
            _databaseHelper = DatabaseHelper._createInstance();
        }
        return _databaseHelper;
    }
}