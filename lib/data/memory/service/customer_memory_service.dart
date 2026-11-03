import 'package:dart_flutter_example/data/memory/configuration/memory.dart';
import 'package:dart_flutter_example/data/repository/customer_repository.dart';
import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:optional/optional.dart';

abstract interface class CustomerMemoryService implements CustomerRepository {}

final class CustomerMemoryServiceImpl extends Memory
    implements CustomerMemoryService {
  final List<Customer> _customers = [
    Customer.from(
      1,
      '0101',
      'Epa',
      'Valencia, Edo Carabobo',
      'prueba@gmail.com',
      '04142589632',
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Customer.from(
      2,
      '0102',
      'Beco',
      'Valencia, Edo Carabobo',
      'prueba@gmail.com',
      '04142589632',
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Customer.from(
      3,
      '0103',
      'Promotora Tántalo',
      'Valencia, Edo Carabobo',
      'prueba@gmail.com',
      '04142589632',
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Customer.from(
      4,
      '0104',
      'Sillaca',
      'Valencia, Edo Carabobo',
      'prueba@gmail.com',
      '04142589632',
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Customer.from(
      5,
      '0105',
      'Febeca',
      'Valencia, Edo Carabobo',
      'prueba@gmail.com',
      '04142589632',
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Customer.from(
      6,
      '0106',
      'Beval',
      'Valencia, Edo Carabobo',
      'prueba@gmail.com',
      '04142589632',
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
  ];

  @override
  Future<void> add(Customer entity) async {
    _customers.add(entity);
  }

  @override
  Future<void> update(Customer entity) async {
    _customers.removeWhere((customer) => customer.id == entity.id);
    _customers.add(entity);
  }

  @override
  Future<void> delete(List<Customer> entities) async {
    for (final entity in entities) {
      _customers.removeWhere((customer) => customer.id == entity.id);
    }
  }

  @override
  Future<List<Customer>> findAll() async => _customers;

  @override
  Future<Optional<Customer>> findById(int id) async {
    final customer = _customers.where((customer) => customer.id == id).first;
    return Optional.ofNullable(customer);
  }

  @override
  Future<List<Customer>> findByName(String name) async {
    return _customers.where((customer) => customer.name == name).toList();
  }

  @override
  Future<List<Customer>> findByCode(String code) async {
    return _customers.where((customer) => customer.code == code).toList();
  }
}
