import 'package:flutter/material.dart';
import 'package:dart_flutter_example/domain/entity/customer.dart';

class SeeCustomerScreen extends StatelessWidget {
  static const routeName = '/customer/see';

  final Customer customer;

  const SeeCustomerScreen({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Datos del Cliente")),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 200,
            child: Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/astronauta.jpg'),
              ),
            ),
          ),
          const Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: const Icon(Icons.grid_on),
            title: const Text("Codigo."),
            subtitle: Text(
              customer.code as String,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Nombre."),
            subtitle: Text(
              customer.name as String,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: const Icon(Icons.directions),
            title: const Text("Direccion."),
            subtitle: Text(
              customer.adress as String,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text("Correo."),
            subtitle: Text(
              customer.mail as String,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text("Telefono."),
            subtitle: Text(
              customer.phone as String,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btnClient",
        tooltip: 'Editar clientes.',
        child: const Icon(Icons.edit),
        onPressed: () {
          //          Navigator.pushNamed(context, UpdateCustomerScreen.routeName,
          //              arguments: new UpdateCustomerEvent(_customer, ReloadCustomerUpdate.SEE_STRATEGY));
        },
      ),
    );
  }
}
