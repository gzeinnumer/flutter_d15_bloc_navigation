import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_d15_bloc_navigation/nav_cubit.dart';
import 'package:flutter_d15_bloc_navigation/post_cubit.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
      ),
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state is LoadingPostState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedPostState) {
          return RefreshIndicator(
            onRefresh: () async {
              return BlocProvider.of<PostBloc>(context).add(PullToRefreshEvent());
            },
            child: ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(state.list[index].title.toString()),
                      onTap: () {
                        return context.read<NavCubit>().showPostDetails(state.list[index]);
                      },
                    ),
                  );
                }),
          );
        } else if (state is FailedToLoadPostState) {
          return Center(
            child: Text('Error occured: ${state.exception.toString()}'),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
