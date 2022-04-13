import 'package:api_with_cubit/models/failure_model.dart';
import 'package:api_with_cubit/models/post_model.dart';
import 'package:api_with_cubit/repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'postfetchapi_state.dart';

class PostfetchapiCubit extends Cubit<PostfetchapiState> {
  final ApiRepository apiRepository;
  PostfetchapiCubit({required this.apiRepository})
      : super(PostfetchapiInitial());

  Future<void> fetchPostApi() async {
    emit(PostfetchapiLoading());
    try {
      final List<Post>? postList = await apiRepository.getPostList();
      emit(PostfetchapiLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(PostfetchapiError(failure: err));
    } catch (err) {
      print(err);
    }
  }
}
