import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_d15_bloc_navigation/post.dart';
import 'package:flutter_d15_bloc_navigation/post_details_view.dart';
import 'package:flutter_d15_bloc_navigation/post_view.dart';

import 'nav_cubit.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post>(builder: (context, state) {
      return Navigator(
        pages: [
          const MaterialPage(child: PostView()),
          if(state.id != null)
            MaterialPage(child: PostDetailView(post: state)),
        ],
        onPopPage: (route, result){
          BlocProvider.of<NavCubit>(context).popToPosts();
          return route.didPop(result);
        },
      );
    });

  }
}
