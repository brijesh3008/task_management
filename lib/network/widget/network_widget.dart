import 'package:task_management/core/config/app_colors.dart';
import 'package:task_management/core/utils/app_size.dart';
import 'package:task_management/core/utils/app_font_style.dart';
import 'package:task_management/network/network_state.dart';
import 'package:flutter/material.dart';

class NetWorkWidgetHandler extends StatefulWidget {
  const NetWorkWidgetHandler({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  State<NetWorkWidgetHandler> createState() => _NetWorkWidgetHandlerState();
}

class _NetWorkWidgetHandlerState extends State<NetWorkWidgetHandler>
    with NetworkMixin {
  OverlayEntry? _overlayEntry;

  void _showNoInternetOverlay() {
    final horizontalPadding = getWidth(18);
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          bottom: getHeight(60),
          left: horizontalPadding,
          right: horizontalPadding,
          child: Container(
            height: getHeight(38),
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(6),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.redD2,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/cancel_round.png',
                  height: getWidth(25),
                  width: getWidth(25),
                ),
                SizedBox(
                  width: getWidth(10),
                ),
                DefaultTextStyle(
                  style: LmgFS.style(
                    12,
                    fontColor: AppColors.white,
                  ),
                  child: const Text(
                    'No Internet',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    OverlayState? overlayState = Overlay.of(context);
    overlayState.insert(_overlayEntry!);
  }

  void _hideNoInternetOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void onDisconnected() {
    _showNoInternetOverlay();
  }

  @override
  void onReconnected() {
    _hideNoInternetOverlay();
  }
}
