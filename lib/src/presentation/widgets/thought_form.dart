import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:koa_health_assignment/src/presentation/bloc/thought_bloc.dart';

import '../../domain/model/thought.dart';

class FormBody extends StatelessWidget {
  FormBody({
    Key key,
    @required GlobalKey<FormState> formKey,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;

  final TextEditingController titleCtrl = new TextEditingController();
  final TextEditingController moodCtrl  = new TextEditingController();
  final TextEditingController descriptionCtrl = new TextEditingController();



  @override
  Widget build(BuildContext context) {
  final _thoughtBloc = BlocProvider.of<ThoughtBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('What is going through your head right now?',
          style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold)),
          TextFormField(
            controller: titleCtrl,
            
          ),
          SizedBox( height: 20.0 ),

          Text('Add more information about your thought',
          style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold)),
          TextFormField(
            controller: descriptionCtrl,
          ),
          SizedBox( height: 20.0 ),

          Text('What is the mood of the thought that you are having today?',
          style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold)),
          TextFormField(
            controller: moodCtrl,
          ),
          SizedBox( height: 30.0 ),  

          _SendFormBtn(_thoughtBloc, context)
        ],
      ),
    );
  }

  ElevatedButton _SendFormBtn(ThoughtBloc _thoughtBloc, BuildContext context) {
    return ElevatedButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
                  DateTime now = new DateTime.now();
                  String date = DateFormat('yyyy-MM-dd – ').format(now); 
                  String time = DateFormat('kk:mm').format(now); 

                  // Create the new thought with the form data
                  Thought _thought = Thought(
                    titleCtrl.text,
                    descriptionCtrl.text,
                    moodCtrl.text,
                    date,
                    time);
                    // Add new thought to bloc, here it would be also added to databases
                  _thoughtBloc.add(AddThoughtEvent(_thought));
                  // Reset the Form
                  _formKey.currentState.reset();
                  Navigator.pop(context);

            }
          },
          child: Text('Save Thought'),
          style: ElevatedButton.styleFrom(
                        primary: Colors.pink.withOpacity(0.6),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
                      ),
        );
  }
}
