

import 'package:floor/floor.dart';

import 'package:koa_health_assignment/src/data/datasource/local/thought_db.dart';

@dao
abstract class ThoughtDao {
  @insert
  Future<void> insertThought(ThoughtDb thought);

  @Query ('SELECT * FROM ThoughtDb')
  Future<List<ThoughtDb>> retrieveThoughts();
}