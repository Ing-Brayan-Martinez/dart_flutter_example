import 'package:dart_flutter_example/domain/controllers/observer/observer.dart';
import 'package:dart_flutter_example/domain/controllers/observer/observer_action.dart';
import 'package:dart_flutter_example/domain/controllers/observer/observer_event.dart';
import 'package:dart_flutter_example/domain/controllers/observer/observer_singlenton.dart';
import 'package:dart_flutter_example/domain/controllers/strategy/reload_strategy.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReloadCustomerFromDataStrategy extends ReloadStrategy {
  late Observer? _observer;
  late BuildContext _context;

  ReloadCustomerFromDataStrategy(BuildContext context) {
    _context = context;
    _observer = SinglentonObserver.get();
  }

  @override
  void reload() {
    _observer?.notify(
      ObserverAction(ObserverEvent.EVENT_LOAD_LIST_CUSTOMER, 0),
    );

    _context.pop();

    print("He pasado por data strategy");
  }
}
