import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management/injection_container.dart';
import 'package:task_management/network/eipl_network_info.dart';

part 'connectivity_state.dart';

@Deprecated('''
ConnectivityCubit is being deprecated in favor of NetworkMixin
''')
class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityLoading()) {
    _monitorConnectivity();
  }

  Future<void> _monitorConnectivity() async {
    NetworkInfo networkInfo = sl();

    if (!await networkInfo.isConnected) {
      emit(NetworkFailure());
    }

    networkInfo.onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      if (_isConnected(result)) {
        emit(NetworkConnected());
      } else {
        emit(NetworkFailure());
      }
    });
  }

  bool _isConnected(value) {
    return value == ConnectivityResult.mobile ||
        value == ConnectivityResult.wifi ||
        value == ConnectivityResult.ethernet;
  }
}
