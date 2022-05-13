import 'package:flutter/material.dart';

import 'package:koa_health_assignment/src/domain/model/thought.dart';
import 'package:koa_health_assignment/src/presentation/widgets/thought_detail_widgets.dart';


class ThoughtDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Thought thought = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ThoughtDetailBody(thought: thought),
          ],
        ),
      )
      
    );
  }
}