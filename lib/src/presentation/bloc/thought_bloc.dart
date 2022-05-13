import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:koa_health_assignment/src/domain/model/thought.dart';

part 'thought_event.dart';
part 'thought_state.dart';

class ThoughtBloc extends Bloc<ThoughtEvent, ThoughtState> {
  ThoughtBloc() : super( ThoughtInitialState() ) {

    on<OnLoadThoughtEvent>( (event, emit) {
      emit( ThoughtSetState( event.thoughts ));
    });

    on<AddThoughtEvent>((event, emit) {
      final thoughts = [...state.thoughtList, event.thought];
      emit( ThoughtSetState( thoughts ));
    });

    on<LoadingThoughtEvent>( (event, emit) {
      emit( ThoughtLoadingState());
    });

  }
}