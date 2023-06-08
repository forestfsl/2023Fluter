// ignore_for_file: unused_element, unused_field, prefer_void_to_null, prefer_const_declarations, prefer_typing_uninitialized_variables

part of next_widgets;

class PopupWindows {
  static void show(BuildContext context, Widget body,
      {double? top,
      double? bottom,
      double? left,
      double? right,
      double? width,
      double? height,
      Color backgroundColor = Colors.transparent,
      bool needAutoClose = false,
      int seconds = 1}) {
    //对之前创建的释放
    _PopUpHelper.createView(context, top, bottom, left, right, width, height,
        backgroundColor, body, needAutoClose, seconds);
  }
}

class _PopUpHelper {
  static late final OverlayEntry _overlayEntry;
  static late bool _isVisible;
  static void createView(
      BuildContext context,
      double? top,
      double? bottom,
      double? left,
      double? right,
      double? width,
      double? height,
      Color backgroundColor,
      Widget body,
      bool needAutoClose,
      int seconds) {
    _overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        width: width,
        height: height,
        child: SafeArea(
            child: Material(
          color: backgroundColor,
          child: body,
        )),
      );
    });
    Overlay.of(context).insert(_overlayEntry);
    _isVisible = true;
    if (needAutoClose) {
      Future.delayed(Duration(seconds: seconds)).then((value) => dismiss());
    }
  }

  static dismiss() {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry.remove();
  }
}
