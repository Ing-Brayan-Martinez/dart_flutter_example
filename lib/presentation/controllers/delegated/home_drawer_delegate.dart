import 'package:dart_flutter_example/presentation/screens/data/data_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'drawer_delegate.dart';

class HomeDrawerDelegate implements DrawerDelegate {
  @override
  void navigateToHome(BuildContext context) {
    context.pop();
  }

  @override
  void navigateToCustomer(BuildContext context) {
    context.push(DataScreen.routeName, extra: 0);
  }

  @override
  void navigateToInvoiced(BuildContext context) {
    context.push(DataScreen.routeName, extra: 1);
  }

  @override
  void navigateToSettings(BuildContext context) {}

  @override
  void navigateToAbout(BuildContext context) {}
}
