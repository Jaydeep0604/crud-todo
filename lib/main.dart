import 'package:crud_todo/blocs/bloc_exports.dart';
import 'package:crud_todo/services/app_router.dart';
import 'package:crud_todo/ui/tabs_screen.dart';
import 'package:flutter/material.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:path_provider/path_provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final Storage = await HydratedStorage.build(
//     storageDirectory: await getApplicationDocumentsDirectory(),
//   );
// HydratedBloc() => runApp(MyApp());
// HydratedBloc(() => runApp(app),(
// () => runApp(MyApp());
// storage: Storage,
// );
// }
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // final Storage = await HydratedStorage.build(
  //   storageDirectory: await getApplicationDocumentsDirectory(),
  // );
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () => runApp(MyApp(
      appRouter: AppRouter(),
    )),
    //storage: Storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        )
      ],
      // for defalut task
      // TasksBloc()..add(AddTask(task: Task(title: "task1"))),
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Task App',
            // theme: state.switcValue?
            // AppTheme.appThemeData[AppTheme.darkTheme]:
            // AppTheme.appThemeData[AppTheme.lightTheme],
            home: TabsScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
