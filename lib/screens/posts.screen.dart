import 'package:advertisy/bloc/posts/posts_bloc.dart';
import 'package:advertisy/bloc/posts/posts_event.dart';
import 'package:advertisy/bloc/posts/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advertisy/template/post-card.template.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc()..add(FetchPosts()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              if (state is PostsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PostsLoaded) {
                final postsModel = state.postsModel;
                return ListView.builder(
                  itemCount: postsModel.posts?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = postsModel.posts![index];
                    return PostCardTemplate(post: item);
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
