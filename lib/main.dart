import 'package:api_with_cubit/cubit/cubit/postfetchapi_cubit.dart';
import 'package:api_with_cubit/repository/api_repository.dart';
import 'package:api_with_cubit/screens/home_page.dart';
import 'package:api_with_cubit/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);
  final ApiService apiService;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => PostfetchapiCubit(
                apiRepository: ApiRepository(apiService: apiService))
              ..fetchPostApi())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
