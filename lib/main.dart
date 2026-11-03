import 'package:dart_flutter_example/presentation/routes/app_routes.dart';
import 'package:dart_flutter_example/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/provider/app_provider.dart';

/// Correr la aplicación
void main() => runApp(const AppWidget());

/// Widget inicaial
class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp.router(
        locale: const Locale("es"),
        theme: AppTheme.lightTheme,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
