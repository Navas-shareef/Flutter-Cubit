part of 'postfetchapi_cubit.dart';

abstract class PostfetchapiState extends Equatable {
  const PostfetchapiState();

  @override
  List<Object> get props => [];
}

class PostfetchapiInitial extends PostfetchapiState {}

class PostfetchapiLoading extends PostfetchapiState {}

class PostfetchapiLoaded extends PostfetchapiState {
  final List<Post> postList;

  const PostfetchapiLoaded({required this.postList});

  @override
  List<Object> get props => [postList];
}

class PostfetchapiError extends PostfetchapiState {
  final Failure failure;

  const PostfetchapiError({required this.failure});

  @override
  List<Object> get props => [failure];
}
