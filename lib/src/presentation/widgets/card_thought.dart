import 'package:flutter/material.dart';

import 'package:koa_health_assignment/src/domain/model/thought.dart';


class ThoughtCard extends StatelessWidget {
  final Thought thought;

  const ThoughtCard({
    Key,key,
    this.thought,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'thought_detail', arguments: this.thought);
      },
      
      child: Container(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        height : 200.0,
        child: _Body(thought: thought),
      )
    );
  }
}


class _Body extends StatelessWidget {
  const _Body({
    Key key,
    @required this.thought,
  }) : super(key: key);

  final Thought thought;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(thought.title),
          Text(thought.mood),
          Row(
            children: [
              Text(thought.date),
              Text(thought.time)
            ],
          )
        ],

      ),
      
    );
  }
}