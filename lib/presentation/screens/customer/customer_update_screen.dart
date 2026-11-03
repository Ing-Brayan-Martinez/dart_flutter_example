import 'package:dart_flutter_example/domain/event/update_customer_event.dart';
import 'package:dart_flutter_example/presentation/screens/customer/component/update_cutomer_form.dart';
import 'package:flutter/material.dart';

class UpdateCustomerScreen extends StatelessWidget {
  static const routeName = '/customer/update';

  final UpdateCustomerEvent event;

  const UpdateCustomerScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Cliente")),
      body: UpdateCustomerForm(event: event),
    );
  }
}
