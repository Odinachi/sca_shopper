import 'package:flutter/material.dart';
import 'package:sca_shopper/services/cache_service.dart';
import 'package:sca_shopper/shared/Navigation/app_route_strings.dart';
import 'package:sca_shopper/shared/Navigation/app_router.dart';
import 'package:sca_shopper/shared/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cache = CacheService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home Screen"),
            SizedBox(
              height: 30,
            ),
            AppButton(
              text: "Logout",
              action: () async {
                await cache.deleteToken().then((_) {
                  AppRouter.push(AppRouteStrings.loginScreen);
                });
              },
            )
          ],
        ),
      ),
    ));
  }
}
