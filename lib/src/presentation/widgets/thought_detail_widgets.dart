import 'package:flutter/material.dart';

import 'package:koa_health_assignment/src/domain/model/thought.dart';

class ThoughtDetailBody extends StatelessWidget {
  
  const ThoughtDetailBody({ 
    Key key, 
    @required this.thought }) 
  : super(key: key);

  final Thought thought; 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 40, 40, 20),
      child: Column(
        mainAxisAlignment : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            thought.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color     : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize  : 26.0,
            )
          ),
          SizedBox( height: 40.0 ),
          Text(
            thought.description,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color   : Colors.black87,
              fontSize: 22.0
            )
          ),
          SizedBox( height: 40.0 ),
          Text(
            'Your mood was: ${thought.mood}',
            style: TextStyle(
              color     : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize  : 18.0,
            )
          ),
        ],
      ),
    );
  }
}