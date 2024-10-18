import 'package:advertisy/models/posts.model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:advertisy/models/products.model.dart';

@immutable
abstract class PostsState extends Equatable {
  @override
  List<Posts> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final PostsModel postsModel;

  PostsLoaded(this.postsModel);

  @override
  List<Posts> get props => postsModel.posts ?? [];
}
