import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:dart_flutter_example/domain/event/update_customer_event.dart';
import 'package:dart_flutter_example/presentation/screens/customer/customer_create_screen.dart';
import 'package:dart_flutter_example/presentation/screens/customer/customer_see_screen.dart';
import 'package:dart_flutter_example/presentation/screens/customer/customer_update_screen.dart';
import 'package:dart_flutter_example/presentation/screens/data/data_screen.dart';
import 'package:dart_flutter_example/presentation/screens/home/home_screen.dart';
import 'package:dart_flutter_example/presentation/screens/invoice/invoice_create_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: HomeScreen.routeName,
    routes: [
      GoRoute(
        path: HomeScreen.routeName,
        pageBuilder: (context, state) => _buildPage(state, const HomeScreen()),
      ),
      GoRoute(
        path: DataScreen.routeName,
        pageBuilder: (context, state) =>
            _buildPage(state, DataScreen(initialTab: state.extra as int? ?? 0)),
      ),
      GoRoute(
        path: CreateCustomerScreen.routeName,
        pageBuilder: (context, state) =>
            _buildPage(state, const CreateCustomerScreen()),
      ),
      GoRoute(
        path: SeeCustomerScreen.routeName,
        pageBuilder: (context, state) => _buildPage(
          state,
          SeeCustomerScreen(customer: state.extra as Customer),
        ),
      ),
      GoRoute(
        path: UpdateCustomerScreen.routeName,
        pageBuilder: (context, state) => _buildPage(
          state,
          UpdateCustomerScreen(event: state.extra as UpdateCustomerEvent),
        ),
      ),
      GoRoute(
        path: CreateInvoiceScreen.routeName,
        pageBuilder: (context, state) =>
            _buildPage(state, const CreateInvoiceScreen()),
      ),
    ],
  );

  static CustomTransitionPage<void> _buildPage(
    GoRouterState state,
    Widget child,
  ) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
