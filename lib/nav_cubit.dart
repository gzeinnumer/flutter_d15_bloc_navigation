import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_d15_bloc_navigation/post.dart';

class NavCubit extends Cubit<Post>{
  NavCubit() : super(Post());

  void showPostDetails(Post post) {
    return emit(post);
  }

  void popToPosts(){
    return emit(Post());
  }
}