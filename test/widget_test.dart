import 'package:dart_flutter_example/main.dart';
import 'package:dart_flutter_example/presentation/routes/app_routes.dart';
import 'package:dart_flutter_example/presentation/screens/data/data_screen.dart';
import 'package:dart_flutter_example/presentation/screens/home/home_screen.dart';
import 'package:dart_flutter_example/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App provides repositories to routed screens', (
    WidgetTester tester,
  ) async {
    AppRoutes.router.go(HomeScreen.routeName);

    await tester.pumpWidget(const AppWidget());
    await tester.pumpAndSettle();

    expect(find.text('Hola'), findsOneWidget);

    AppRoutes.router.go(DataScreen.routeName);
    await tester.pumpAndSettle();

    expect(find.text('Clientes'), findsOneWidget);
    expect(find.text('Facturas'), findsOneWidget);
    expect(find.text('Epa'), findsOneWidget);
    expect(
      Theme.of(tester.element(find.byType(Scaffold).first)).colorScheme.primary,
      AppTheme.lightTheme.colorScheme.primary,
    );
  });
}
