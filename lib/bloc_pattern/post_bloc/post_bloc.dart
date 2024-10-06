import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc204/repository/post_repo.dart';
import 'package:flutter/material.dart';


part 'post_event.dart';
part 'post_state.dart';

 class PostBloc extends Bloc<PostEvent, PostState>{
  final PostRepo postRepo;
  PostBloc(this.postRepo) : super(PostInitialState()){
    on<InputPostEvent>((event, emit)async{
   final data =  await postRepo.postRepoFun(userId: event.userId, id: event.id, title: event.title, body: event.body,).then((value){
            Future.delayed(Duration(seconds: 4), (){
             Navigator.pop(event.context);
            });
          }).onError(
       (e, s){
         emit(PostErrorState(errorMessage: e));
       }
   );
      emit(PostLoadedState(data ?? null));
      debugPrint(data.toString());
    }
    );
  }
}
