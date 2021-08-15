import 'package:hive/hive.dart';
part 'watchbox.g.dart';

@HiveType(typeId: 0)
class WatchBox extends HiveObject {

    @HiveField(0)
    late String title;

    @HiveField(1)
    late String url;

    @HiveField(2)
    late String director;
}