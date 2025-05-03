import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:task_management/injection_container.dart';
import 'package:task_management/network/eipl_network_info.dart';
import 'package:flutter/material.dart';

mixin NetworkMixin<T extends StatefulWidget> on State<T> {
  late final StreamSubscription<List<ConnectivityResult>> _networkSubscription;
  late final NetworkInfo _networkInfo;

  void onReconnected();
  void onDisconnected();

  Future<void> _initConnectivity() async {
    late final List<ConnectivityResult> result;
    try {
      result = await _networkInfo.checkConnectivity();
      var isConnected = result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.ethernet);
      if (!isConnected) {
        onDisconnected();
      }
    } on Exception catch (e) {
      log(e.toString());
    }

    if (!mounted) {
      return Future.value(null);
    }

    // _updateConnectionStatus(result);

    _networkSubscription =
        _networkInfo.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void initState() {
    super.initState();
    _networkInfo = sl();
    _initConnectivity();
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet)) {
      onReconnected();
    } else {
      onDisconnected();
    }
  }

  void _cancelSubscription() {
    try {
      _networkSubscription.cancel();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    _cancelSubscription();
    super.dispose();
  }
}
