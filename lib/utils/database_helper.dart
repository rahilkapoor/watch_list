import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
// import 'package:watch_list/models/movies.dart';

class DatabaseHelper{

    static final _dbName = 'watchList.db';
    static final _dbVersion = 1;
    static final _tableName = 'watchlist';

    static final columnId = '_id';
    static final columnTitle = 'title';
    static final columnUrl = 'url';
    static final columnDirector = 'director';

    DatabaseHelper._privateConstructor();
    static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
    
    static Database? _database;
    Future<Database> get database async => _database ??= await _initiateDatabase();
    

    Future<Database> _initiateDatabase() async{

        Directory directory = await getApplicationDocumentsDirectory();
        String path = join(directory.path, _dbName);

        return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);



    }

    Future? _onCreate(Database db, int version){
        db.execute(
            '''
            CREATE TABLE $_tableName (
                $columnId INTEGER PRIMARY KEY AUTO INCREMENT,
                $columnTitle TEXT NOT NULL,
                $columnUrl TEXT NOT NULL,
                $columnDirector TEXT NOT NULL
                )

            '''
        );
    }

    Future<int> insert(Map<String, dynamic> row) async{
        Database db = await instance.database;
        return await db.insert(_tableName, row);
    }

    Future<List<Map<String, dynamic>>> queryAll() async{
        Database db = await instance.database;
        return await db.query(_tableName);
    }

    Future<int> update(Map<String,dynamic> row) async{
        Database db = await instance.database;
        int id = row[columnId];
        return await db.update(_tableName, row, where:'$columnId = ?', whereArgs: [id]);

    }

    Future<int> delete(int id) async{
        Database db = await instance.database;
        return await db.delete(_tableName,where:'$columnId=?',whereArgs: [id]);
    }

    Future<int?> getCount() async{
        Database db = await instance.database;
        List<Map<String, dynamic>> x =  await db.rawQuery(
            '''
            SELECT COUNT(*) FROM $_tableName;            
            '''
        );
        int ?res = Sqflite.firstIntValue(x);
        return res;
    }
}