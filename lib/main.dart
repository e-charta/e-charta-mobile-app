import 'package:echarta/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flow_builder/flow_builder.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './helper/colors.dart';
import './services/auth_repository.dart';
import './services/routs.dart';
import 'bloc/auth/bloc_observer.dart';
// import 'bloc/app_cubit.dart';
// import './bloc/app_cubit_logics.dart';
// import 'services/get_data.dart';
// import './pages/notification_page.dart';
// import './pages/login_page.dart';
// import './pages/main_page.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final authRepository = AuthRepository();
    runApp(MyApp(authRepository: authRepository));
  }, blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  final AuthRepository _authRepository;
  const MyApp({
    Key? key,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (context) => AuthBloc(authRepository: _authRepository),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.mainColor,
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black.withOpacity(0.7),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 18.0,
            color: Colors.black.withOpacity(0.7),
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      home: FlowBuilder(
        state: context.select((AuthBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
      // home: BlocProvider(
      //   create: (context) => AppCubit(data: GetData()),
      //   child: AppCubitLogics(),
      // ),
    );
  }
}
