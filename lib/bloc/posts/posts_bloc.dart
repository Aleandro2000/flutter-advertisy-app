import 'package:advertisy/services/posts.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'posts_event.dart';
import 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<FetchPosts>((event, emit) async {
      try {
        emit(PostsLoading());
        final postModel = await getPosts();
        emit(PostsLoaded(postModel!));
      } catch (err) {
        if (kDebugMode) {
          print(err);
        }
      }
    });
  }
}
