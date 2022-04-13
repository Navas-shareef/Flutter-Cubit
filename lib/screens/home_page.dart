import 'package:api_with_cubit/cubit/cubit/postfetchapi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Fetch with Cubit'),
      ),
      body: BlocBuilder<PostfetchapiCubit, PostfetchapiState>(
        builder: (context, state) {
          if (state is PostfetchapiLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostfetchapiError) {
            return Center(
              child: Text(state.failure.message),
            );
          } else if (state is PostfetchapiLoaded) {
            final postList = state.postList;
            return postList.isEmpty
                ? const Center(child: Text('No Item Available'))
                : ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(postList[index].id.toString()),
                        ),
                        title: Text(postList[index].title),
                        subtitle: Text(postList[index].body),
                      );
                    });
          }
          return const Center(
            child: Text('home'),
          );
        },
      ),
    );
  }
}
