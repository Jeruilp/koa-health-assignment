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
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        mainAxisAlignment : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            thought.description,
            overflow : TextOverflow.ellipsis,
            style: TextStyle(
              color     : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize  : 24.0,
            )
          ),
          SizedBox( height: 20.0 ),
          Text(
            thought.description,
            // overflow : TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color   : Colors.black87,
              fontSize: 14.0
            )
          )
        ],
      ),
    );
  }
}