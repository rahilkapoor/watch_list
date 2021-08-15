import 'package:hive/hive.dart';
import 'package:watch_list/models/watchbox.dart';


class Boxes{
    static Box<WatchBox> getWatchBoxes() => Hive.box<WatchBox>('watchbox');

}