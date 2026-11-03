import 'package:dart_flutter_example/domain/controllers/observer/observer.dart';
import 'package:dart_flutter_example/domain/controllers/observer/observer_action.dart';
import 'package:dart_flutter_example/domain/controllers/observer/observer_event.dart';
import 'package:dart_flutter_example/domain/controllers/observer/observer_singlenton.dart';
import 'package:dart_flutter_example/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'drawer_delegate.dart';

class DataDrawerDelegated implements DrawerDelegate {
  late Observer? _observer;

  DataDrawerDelegated() {
    _observer = SinglentonObserver.get();
  }

  @override
  void navigateToHome(BuildContext context) {
    context.go(HomeScreen.routeName);
  }

  @override
  void navigateToCustomer(BuildContext context) {
    _observer?.notify(ObserverAction(ObserverEvent.EVENT_TAB_CUSTOMER, 0));
    context.pop();
  }

  @override
  void navigateToInvoiced(BuildContext context) {
    _observer?.notify(ObserverAction(ObserverEvent.EVENT_TAB_INVOICE, 1));
    context.pop();
  }

  @override
  void navigateToSettings(BuildContext context) {
    context.pop();
  }

  @override
  void navigateToAbout(BuildContext context) {
    context.pop();
  }
}
