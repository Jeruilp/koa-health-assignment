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
        padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
        margin : EdgeInsets.only(left: 30, top: 15, right: 30, bottom: 15),
        height : 130.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color : Colors.grey.withOpacity(0.7),
              offset: Offset(2,3),
              spreadRadius: 4,
              blurRadius  : 5,
            )
          ],
        ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment : MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              thought.title,
              style: TextStyle(
              fontWeight: FontWeight.bold,
              color     : Colors.black,
              fontSize  : 18.0
            )),
            SizedBox( height: 15.0 ),
            Row(
              children: [
                Text(thought.date),
                Text(thought.time)
              ],
            )
          ],

        ),
      ],
    );
  }
}