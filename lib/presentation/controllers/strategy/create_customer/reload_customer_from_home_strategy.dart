import 'package:dart_flutter_example/domain/controllers/observer/observer.dart';
import 'package:dart_flutter_example/domain/controllers/observer/observer_action.dart';
import 'package:dart_flutter_example/domain/controllers/observer/observer_event.dart';
import 'package:dart_flutter_example/domain/controllers/observer/observer_singlenton.dart';
import 'package:dart_flutter_example/domain/controllers/strategy/reload_strategy.dart';
import 'package:dart_flutter_example/presentation/screens/data/data_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReloadCustomerFromHomeStrategy extends ReloadStrategy {
  late Observer? _observer;
  late BuildContext _context;

  ReloadCustomerFromHomeStrategy(BuildContext context) {
    _context = context;
    _observer = SinglentonObserver.get();
  }

  @override
  void reload() {
    _context.go(DataScreen.routeName, extra: 0);

    //recargar la lista de laotra ventana para ver el resultado
    _observer?.notify(
      ObserverAction(ObserverEvent.EVENT_LOAD_LIST_CUSTOMER, 0),
    );
    print("He pasado por home strategy");
  }
}
