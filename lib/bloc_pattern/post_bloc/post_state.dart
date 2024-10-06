part of 'post_bloc.dart';

abstract class PostState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class PostInitialState extends PostState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class PostLoadedState extends PostState{
  final PostRepo? postRepo;
  PostLoadedState(this.postRepo);
  @override
  // TODO: implement props
  List<Object?> get props => [postRepo];

}

final class PostErrorState extends PostState{
  final Object? errorMessage;
  PostErrorState({this.errorMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}


