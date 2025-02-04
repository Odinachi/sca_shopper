import 'package:flutter/cupertino.dart';
import 'package:sca_shopper/features/authentication/views/login_screen.dart';
import 'package:sca_shopper/features/authentication/views/register_screen.dart';
import 'package:sca_shopper/features/home/views/home_screen.dart';
import 'package:sca_shopper/features/products/views/product_details.dart';
import 'package:sca_shopper/features/products/views/product_list.dart';
import 'package:sca_shopper/models/response_model/category_model.dart';
import 'package:sca_shopper/models/response_model/product_model.dart';
import 'package:sca_shopper/shared/Navigation/app_route_strings.dart';

import '../../features/products/views/checkout_screen.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteStrings.loginScreen:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case AppRouteStrings.registerScreen:
        return CupertinoPageRoute(builder: (_) => const RegisterScreen());
      case AppRouteStrings.homeScreen:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());

      case AppRouteStrings.checkoutScreen:
        return CupertinoPageRoute(builder: (_) => const CheckoutScreen());
      case AppRouteStrings.productDetailsScreen:
        return CupertinoPageRoute(
            builder: (_) => ProductDetailsScreen(
                  model: settings.arguments as ProductModel?,
                ));
      case AppRouteStrings.productListScreen:
        return CupertinoPageRoute(
            builder: (_) => ProductListScreen(
                categoryModel: settings.arguments as CategoryModel?));

      default:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
    }
  }

  static void push(String name, {Object? arg}) {
    navKey.currentState?.pushNamed(name, arguments: arg);
  }

  static void pushReplace(String name, {Object? arg}) {
    navKey.currentState?.pushReplacementNamed(name, arguments: arg);
  }

  static void pop(String name, {Object? arg}) {
    navKey.currentState?.pop(arg);
  }

  static void pushAndClear(String name, {Object? arg}) {
    navKey.currentState?.pushNamedAndRemoveUntil(name, (_) => false);
  }
}
