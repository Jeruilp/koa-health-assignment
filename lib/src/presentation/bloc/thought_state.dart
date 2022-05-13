part of 'thought_bloc.dart';

@immutable
abstract class ThoughtState {
  final bool existThought;
  final bool isLoading;
  final List<Thought> thoughtList; 

  const ThoughtState({
    this.existThought = false,
    this.isLoading    = false, 
    this.thoughtList
  });
}

class ThoughtInitialState extends ThoughtState {
  const ThoughtInitialState(): super( existThought: false, isLoading: false, thoughtList: null);
}

class ThoughtSetState extends ThoughtState {
  final List<Thought> newThoughts;
  ThoughtSetState(this.newThoughts)
    : super( existThought: true, isLoading: false, thoughtList: newThoughts);
}


class ThoughtLoadingState extends ThoughtState {
  ThoughtLoadingState()
    : super( isLoading: true );
}