import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite; 
import 'package:path/path.dart'; 
import 'package:floor/floor.dart';

import 'package:koa_health_assignment/src/data/datasource/local/thought_db.dart';
import 'package:koa_health_assignment/src/data/datasource/local/thought_dao.dart';

// part 'thought_database.g.dart';

@Database(version: 1, entities: [ThoughtDb])
abstract class ThoughtDatabase extends FloorDatabase {
  ThoughtDao get thoughtDao; 
}