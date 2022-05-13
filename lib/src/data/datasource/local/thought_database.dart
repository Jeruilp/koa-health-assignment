import 'dart:async';
import 'package:koa_health_assignment/src/data/datasource/local/thought_dao.dart';
import 'package:koa_health_assignment/src/data/datasource/local/thought_db.dart';
import 'package:path/path.dart'; 
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite; 


part 'thought_database.g.dart';

@Database(version: 1, entities: [ThoughtDb])
abstract class ThoughtDatabase extends FloorDatabase {
  ThoughtDao get thoughtDao; 
}