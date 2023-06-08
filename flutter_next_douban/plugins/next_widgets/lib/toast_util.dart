// ignore_for_file: unused_element, unused_local_variable, prefer_const_constructors

part of next_widgets;

class ToastUtil {
  static void show(BuildContext context, String message,
      {ToastPosition postion = ToastPosition.bottom,
      Color backgroundColor = Colors.black,
      Color textColor = Colors.white,
      double radius = 20}) {
    _ToastHelper.showMessage(
        context, backgroundColor, radius, message, textColor, postion, true, 2);
  }
}

class _ToastHelper {
  static void showMessage(
      BuildContext context,
      Color backgroundColor,
      double radius,
      String msg,
      Color textColor,
      ToastPosition postion,
      bool needAutoClose,
      int seconds) {
    Widget body = Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius)),
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Text(
          msg,
          softWrap: true,
          style: TextStyle(fontSize: 14, color: textColor),
        ),
      ),
    );

    PopupWindows.show(context, body,
        top: postion == ToastPosition.top ? 50 : null,
        bottom: postion == ToastPosition.bottom ? 50 : null,
        needAutoClose: needAutoClose,
        seconds: seconds);
  }
}
