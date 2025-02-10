import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gdm_assignment/moteis/data/data_source/home_remote_data_source.dart';
import 'package:gdm_assignment/moteis/data/repository/home_repository_impl.dart';
import 'package:gdm_assignment/moteis/domain/repository/home_repository.dart';
import 'package:gdm_assignment/moteis/domain/use_case/get_moteis_use_case.dart';
import 'package:gdm_assignment/moteis/presentation/page/home_page.dart';
import 'package:gdm_assignment/moteis/presentation/state/home_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  final GetIt getIt = GetIt.instance;
  final Dio dio = Dio();

  getIt
    ..registerSingleton<HomeRemoteDataSource>(HomeRemoteDataSourceImpl(dio))
    ..registerSingleton<HomeRepository>(
      HomeRepositoryImpl(getIt.get()),
    );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(
            GetMoteisUseCase(getIt.get()),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      color: Colors.white,
      home: HomePage(),
    );
  }
}
