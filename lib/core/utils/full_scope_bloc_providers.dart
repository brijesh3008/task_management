import 'package:task_management/features/dashboard/presentation/manager/task_list/task_list_bloc.dart';
import 'package:task_management/injection_container.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:provider/single_child_widget.dart';

class FullScopedBlocProviders {
  static List<SingleChildWidget> providers = <SingleChildWidget>[
    BlocProvider<TaskBloc>(
      create: (_) => sl<TaskBloc>(),
    ),
  ];
}
