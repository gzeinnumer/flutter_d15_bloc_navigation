import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_d15_bloc_navigation/data_service.dart';
import 'package:flutter_d15_bloc_navigation/post.dart';

//type 2
//event
abstract class PostEvent{}

class LoadPostEvent extends PostEvent{}

class PullToRefreshEvent extends PostEvent{}

//state
abstract class PostState{}

class LoadingPostState extends PostState{}

class LoadedPostState extends PostState{
  final List<Post> list;

  LoadedPostState(this.list);
}

class FailedToLoadPostState extends PostState{
  final Error exception;

  FailedToLoadPostState(this.exception);
}

//bloc
class PostBloc extends Bloc<PostEvent, PostState>{
  final _dataService = DataService();

  PostBloc() : super(LoadingPostState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if(event is LoadPostEvent || event is PullToRefreshEvent){
      yield LoadingPostState();
      try{
        final res = await _dataService.getPosts();
        yield LoadedPostState(res);
      } on Error catch(e){
        yield FailedToLoadPostState(e);
      }
    }
  }
}

