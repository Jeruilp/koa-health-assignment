import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:koa_health_assignment/src/domain/model/thought.dart';
import 'package:koa_health_assignment/src/presentation/bloc/thought_bloc.dart';
import 'package:koa_health_assignment/src/presentation/widgets/card_thought.dart';

class ThoughtPage extends StatefulWidget {

  @override
  _ThoughtPageState createState() => _ThoughtPageState();
}

class _ThoughtPageState extends State<ThoughtPage> {

  @override
  void initState() {
    
    _loadThoughts();

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thoughts'),
        centerTitle: true,
      ),
      body: BlocBuilder<ThoughtBloc, ThoughtState>(
          builder: (context, state) {
            return state.existThought && !state.isLoading
              ? RefreshIndicator(
                onRefresh: _loadThoughts,
                child: ListView.builder(
                  physics    : BouncingScrollPhysics(),
                  shrinkWrap : true,
                  itemCount  : state.thoughtList.length,
                  itemBuilder: (_, i) {
                    return ThoughtCard(thought: state.thoughtList[i]);
                  },
                ),
              )
              : Center(child: CircularProgressIndicator());
          },
        )
    );
  }


  Future<void> _loadThoughts() async {

    final _thoughtBloc = BlocProvider.of<ThoughtBloc>(context);
    final DateTime now = new DateTime.now();
    final String date = now.month.toString() + now.day.toString() + now.year.toString();
    final String time = now.hour.toString() + now.minute.toString();
    final t1 = new Thought('t1','des1','mood1', date, time);
    final t2 = new Thought('t2','des2','mood2', date, time);
    final t3 = new Thought('t3','des3','mood3', date, time);
    _thoughtBloc.add(OnLoadThoughtEvent([t1,t2,t3]));


  }
}






//   Future<void> _loadGames() async {
//     GameService _gameService = locator<GameService>();
//     final _gamesBloc = BlocProvider.of<GamesBloc>(context);

//     _gamesBloc.add( LoadingGamesEvent());

//     // Game service
//     final dynamic response = await _gameService.getGames();
//       if (response != null) {
//         // Add games data to BLOC 
//         _gamesBloc.add( OnLoadGamesEvent(response) );
//       } else {
//         Toast.show("It's been a problem loading the data",
//           duration: 3,
//           gravity: Toast.center,
//           backgroundColor: Colors.black87);
//       }
//   }
// }