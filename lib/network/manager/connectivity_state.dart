part of 'connectivity_cubit.dart';

@Deprecated('''
ConnectivityCubit is being deprecated in favor of NetworkMixin
''')
abstract class ConnectivityState extends Equatable {
  const ConnectivityState();
}
@Deprecated('''
ConnectivityCubit is being deprecated in favor of NetworkMixin
''')
class ConnectivityLoading extends ConnectivityState {
  @override
  List<Object> get props => [];
}

@Deprecated('''
ConnectivityCubit is being deprecated in favor of NetworkMixin
''')
class NetworkConnected extends ConnectivityState {
  @override
  List<Object> get props => [];
}

@Deprecated('''
ConnectivityCubit is being deprecated in favor of NetworkMixin
''')
class NetworkFailure extends ConnectivityState {
  @override
  List<Object> get props => [];
}
