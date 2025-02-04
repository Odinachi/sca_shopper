import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:sca_shopper/services/cache_service.dart';
import 'package:sca_shopper/shared/Navigation/app_route_strings.dart';
import 'package:sca_shopper/shared/Navigation/app_router.dart';

import 'features/products/view_models/product_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  await CacheService().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: AppRouter.navKey,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: CacheService().getToken() != null
            ? AppRouteStrings.homeScreen
            : AppRouteStrings.loginScreen,
        title: 'Flutter Demo',
      ),
    );
  }
}
