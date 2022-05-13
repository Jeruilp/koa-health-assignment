part of 'thought_bloc.dart';

@immutable
abstract class ThoughtEvent {}

class OnLoadThoughtEvent extends ThoughtEvent {
  final List<Thought> thoughts;
  OnLoadThoughtEvent(this.thoughts);
}

class LoadingThoughtEvent extends ThoughtEvent {
  
}
