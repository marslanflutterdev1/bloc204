part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class InputPostEvent extends PostEvent{
 final int userId;
 final int id;
 final String title;
 final String body;
 final BuildContext context;

 InputPostEvent({required this.userId, required this.id, required this.title, required this.body, required this.context});

 @override
  // TODO: implement props
  List<Object> get props => [userId, id, title, body, context];

}
