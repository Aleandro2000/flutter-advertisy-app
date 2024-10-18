import 'package:advertisy/models/posts.model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PostsEvent extends Equatable {
  @override
  List<Posts> get props => [];
}

class FetchPosts extends PostsEvent {}
