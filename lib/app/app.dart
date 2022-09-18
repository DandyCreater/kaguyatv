import 'package:eko_projects/data/bloc/auth-bloc/login-bloc/login_bloc.dart';
import 'package:eko_projects/data/bloc/dashboard-bloc/animefy-bloc/animefy_bloc.dart';
import 'package:eko_projects/data/bloc/dashboard-bloc/dorama-bloc/dashboard_dorama_bloc.dart';
import 'package:eko_projects/data/bloc/dashboard-bloc/menu-bloc/dashboard_menu_bloc.dart';
import 'package:eko_projects/data/bloc/dashboard-bloc/movie-bloc/dashboard_movie_bloc.dart';
import 'package:eko_projects/data/bloc/dashboard-bloc/serial-bloc/dashboard_serial_bloc.dart';
import 'package:eko_projects/data/bloc/dashboard-bloc/streaming-bloc/dashboard_streaming_bloc.dart';
import 'package:eko_projects/data/bloc/homepage-bloc/dorama-bloc/dorama_bloc.dart';
import 'package:eko_projects/data/bloc/homepage-bloc/menu-bloc/menu_bloc.dart';
import 'package:eko_projects/data/bloc/homepage-bloc/movie-bloc/movie_bloc.dart';
import 'package:eko_projects/data/bloc/homepage-bloc/serial-bloc/serial_bloc.dart';
import 'package:eko_projects/data/bloc/homepage-bloc/streaming-bloc/streaming_bloc.dart';
import 'package:eko_projects/data/bloc/play-bloc/related/related_play_bloc.dart';
import 'package:eko_projects/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  MyApp._instance();
  int appState = 0;
  factory MyApp() => instance;

  static final MyApp instance = MyApp._instance();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //Homepage Bloc
        BlocProvider(create: ((_) => MenuBloc()..add(FetchMenu()))),
        BlocProvider(create: ((_) => StreamingBloc()..add(FetchStream()))),
        BlocProvider(create: ((_) => SerialBloc()..add(FetchSerial()))),
        BlocProvider(create: ((_) => DoramaBloc()..add(FetchDorama()))),
        BlocProvider(create: ((_) => MovieBloc()..add(FetchMovie()))),

        //Dashboard Bloc
        BlocProvider(
            create: ((_) => DashboardMenuBloc()..add(FetchDashboardMenu()))),
        BlocProvider(
            create: ((_) =>
                DashboardSerialBloc()..add(FetchDashboardSerial()))),
        BlocProvider(
            create: ((_) =>
                DashboardStreamingBloc()..add(FetchDashboardStreaming()))),
        BlocProvider(
            create: ((_) =>
                DashboardDoramaBloc()..add(FetchDashboardDorama()))),
        BlocProvider(
            create: ((_) => DashboardMovieBloc()..add(FetchDashboardMovie()))),

        //Play Bloc
        BlocProvider(create: ((_) => RelatedPlayBloc()..add(FetchRelated()))),

        //Anime For You Bloc
        BlocProvider(create: ((_) => AnimefyBloc()..add(FetchAnimeFY()))),

        //Login Bloc
        BlocProvider(create: ((_) => LoginBloc()))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashScreen,
      ),
    );
  }
}
