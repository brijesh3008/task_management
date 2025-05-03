import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:task_management/core/helpers/impl_repo_helper.dart';
import 'package:task_management/core/hive_db/db_helper.dart';
import 'package:task_management/core/utils/app_local_preference.dart';
import 'package:task_management/features/base/base_bloc/data/data_sources/base_rds.dart';
import 'package:task_management/features/base/base_bloc/data/repositories/base_repo_impl.dart';
import 'package:task_management/features/base/base_bloc/domain/repositories/base_repo.dart';
import 'package:task_management/features/base/base_bloc/domain/use_cases/base_uc.dart';
import 'package:task_management/features/base/base_bloc/presentation/manager/base_bloc.dart';
import 'package:task_management/features/dashboard/data/repositories/task_list_repo_impl.dart';
import 'package:task_management/features/dashboard/domain/use_cases/task_list_post_us.dart';
import 'package:task_management/features/dashboard/domain/use_cases/task_list_uc.dart';
import 'package:get_it/get_it.dart';
import 'package:task_management/features/dashboard/presentation/manager/task_list/task_list_bloc.dart';

import 'features/dashboard/data/data_sources/task_list_rds.dart';
import 'features/dashboard/domain/repositories/task_list_repo.dart';
import 'network/eipl_network_info.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  /// ----- Bloc / Cubits -----
  // sl.registerFactory(() => DashboardSearchCubit(dashboardSearchUc: sl()));
  //

  // sl.registerFactory(
  //     () => DashboardBloc(dashboardUC: DashboardUC(dashboardRepo: DashboardRepo())));
  //

  sl.registerFactory(
      () => TaskBloc(taskUC: sl(), taskPostUC: sl()));

  sl.registerLazySingleton(() => TaskUC(taskRepo: sl()));
  sl.registerLazySingleton(() => GlitchTaskPostUC(taskRepo: sl()));

  sl.registerFactory(() => BaseBloc(sl(), sl()));

  sl.registerLazySingleton(() => BasedUC(baseRepo: sl()));

  //
  // sl.registerLazySingleton(() => SearchProductListUC(dashboardRepo: sl()));
  //
  // sl.registerLazySingleton(() => DashboardSearchUC(dashboardRepo: sl()));
  //
  // sl.registerLazySingleton(() => DashboardDataListUC(dashboardRepo: sl()));

  /// ----- Repository -----

  sl.registerLazySingleton<TaskRepo>(() => TaskRepoImpl(
      networkInfo: sl(), taskRDS: sl(),implRepoHelper: sl()));

  sl.registerLazySingleton<TaskRDS>(
    () => TaskRDSImpl(),
  );

  sl.registerLazySingleton<BaseRepo>(
      () => BaseRepoImpl(networkInfo: sl(), baseRDS: sl()));


  sl.registerLazySingleton<BaseRDS>(
      () => BaseRDSImpl());
/// IMPL repo helper

  sl.registerLazySingleton(() => ImplRepoHelper(sl()));

  /// ----- Core -----
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<DbHelper>(() => DbHelper());

  /// ----- External -----
  sl.registerLazySingleton(() => Connectivity());

  /// ----- Utils -----
  sl.registerLazySingleton(() => LocalPreference());
}
