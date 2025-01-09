import 'package:flutter/cupertino.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route onGenerateRoute(RouteSettings settings) {
    return CupertinoPageRoute(builder: (_) => SizedBox());
  }
}
