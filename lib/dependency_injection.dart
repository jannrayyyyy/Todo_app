import 'package:get_it/get_it.dart';
import 'package:todo/data/datasource/remote_datasource.dart';
import 'package:todo/data/repository/repository_impl.dart';
import 'package:todo/domain/repository/repository.dart';
import 'package:todo/domain/usecases/add_todo.dart';
import 'package:todo/domain/usecases/delete_todo.dart';
import 'package:todo/domain/usecases/get_todo.dart';
import 'package:todo/domain/usecases/sign_in.dart';
import 'package:todo/domain/usecases/sign_out.dart';
import 'package:todo/domain/usecases/sign_up.dart';
import 'package:todo/domain/usecases/update_todo.dart';
import 'package:todo/domain/usecases/user_state.dart';
import 'package:todo/presentation/cubit/authentication/authentication_cubit.dart';
import 'package:todo/presentation/cubit/todo/todo_cubit.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => AuthenticationCubit(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => TodoCubit(sl(), sl(), sl(), sl()));

  sl.registerLazySingleton(() => SignIn(repo: sl()));
  sl.registerLazySingleton(() => SignUp(repo: sl()));
  sl.registerLazySingleton(() => SignOut(repo: sl()));
  sl.registerLazySingleton(() => AddTodo(repo: sl()));
  sl.registerLazySingleton(() => UpdateTodo(repo: sl()));
  sl.registerLazySingleton(() => DeleteTodo(repo: sl()));
  sl.registerLazySingleton(() => GetTodo(repo: sl()));
  sl.registerLazySingleton(() => StreamUserState(repo: sl()));
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(sl()));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
}
