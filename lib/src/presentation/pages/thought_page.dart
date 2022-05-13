import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Import model
import 'package:koa_health_assignment/src/domain/model/thought.dart';
// Import Bloc
import 'package:koa_health_assignment/src/presentation/bloc/thought_bloc.dart';
// Import widgets
import 'package:koa_health_assignment/src/presentation/widgets/widgets.dart';

class ThoughtPage extends StatefulWidget {

  @override
  _ThoughtPageState createState() => _ThoughtPageState();
}

class _ThoughtPageState extends State<ThoughtPage> {

  @override
  void initState() {
    
    // Load the thoughts stored in database (remote or local)
    _loadThoughts();

    super.initState();
  }



  final _formKey = GlobalKey<FormState>();

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
              ? SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      physics    : BouncingScrollPhysics(),
                      shrinkWrap : true,
                      itemCount  : state.thoughtList.length,
                      itemBuilder: (_, i) {
                        return ThoughtCard(thought: state.thoughtList[i]);
                      },
                    ),
                    SizedBox( height: 30.0 ),
                    ElevatedButton(
                      child: Text('Add a Thought'),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context, 
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
                          isScrollControlled: true,
                          builder: (context) {
                            return Form(
                              key  : _formKey,
                              child: FormBody(formKey: _formKey)
                            );
                          });
                      }, 
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink.withOpacity(0.6),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)
                      ),
                    )
                  ],
                ),
              )
              : Center(child: CircularProgressIndicator());
          },
        )
    );
  }




  Future<void> _loadThoughts() async {

    // Here we would call Thought Service to load initial data from database
    // Simulation of 3 thoughts that would be retrieved from database
    final _thoughtBloc = BlocProvider.of<ThoughtBloc>(context);
    final DateTime now = new DateTime.now();
    final String date = DateFormat('yyyy-MM-dd – ').format(now); 
    final String time = DateFormat('kk:mm').format(now); 
    final t1 = new Thought('I need to think more what the other person is feeling','The other day I say something to Molly that made her feel bad, and I did not realice about that until next day','Guilty', date, time);
    final t2 = new Thought('I should talk less when meeting with friends','I think this is not a true thought due to noone has ever told me that','Afraid', date, time);
    final t3 = new Thought('I should avoid overthinking at bed time when next morning I have to wake up early','This is a real problem, I should start doing some routines to relax myself befor going to bed','Overwhelmed', date, time);
    _thoughtBloc.add(OnLoadThoughtEvent([t1,t2,t3]));


  }
}









