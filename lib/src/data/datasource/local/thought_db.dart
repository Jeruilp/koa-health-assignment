import 'package:floor/floor.dart';

import 'package:koa_health_assignment/src/domain/model/thought.dart';

@entity
class ThoughtDb {
  @PrimaryKey(autoGenerate: true)
  int id; 
  String title; 
  String description; 
  String mood; 
  String date; 
  String time; 

  ThoughtDb({
    this.id, 
    this.title,
    this.description,
    this.mood,
    this.date,
    this.time
  });

  Thought toThought() {
    return Thought(
      this.title,
      this.description,
      this.mood,
      this.date,
      this.time
    );
  }
}