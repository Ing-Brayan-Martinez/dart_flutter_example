import 'package:dart_flutter_example/data/memory/configuration/memory.dart';
import 'package:dart_flutter_example/data/repository/invoice_repository.dart';
import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:dart_flutter_example/domain/entity/invoice.dart';
import 'package:optional/optional.dart';

abstract interface class InvoiceMemoryService implements InvoiceRepository {}

final class InvoiceMemoryServiceImpl extends Memory
    implements InvoiceMemoryService {
  final List<Invoice> _invoices = [
    Invoice.from(
      1,
      '0101',
      Customer.min(1, 'Epa'),
      100.0,
      50.0,
      16,
      150.0,
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Invoice.from(
      2,
      '0102',
      Customer.min(1, 'Epa'),
      100.0,
      50.0,
      16,
      150.0,
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Invoice.from(
      3,
      '0103',
      Customer.min(2, 'Beco'),
      100.0,
      50.0,
      16,
      150.0,
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Invoice.from(
      4,
      '0104',
      Customer.min(2, 'Beco'),
      100.0,
      50.0,
      16,
      150.0,
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Invoice.from(
      5,
      '0105',
      Customer.min(3, 'Promotora Tántalo'),
      100.0,
      50.0,
      16,
      150.0,
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Invoice.from(
      6,
      '0106',
      Customer.min(3, 'Promotora Tántalo'),
      100.0,
      50.0,
      16,
      150.0,
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Invoice.from(
      7,
      '0107',
      Customer.min(4, 'Sillaca'),
      100.0,
      50.0,
      16,
      150.0,
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Invoice.from(
      8,
      '0108',
      Customer.min(4, 'Sillaca'),
      100.0,
      50.0,
      16,
      150.0,
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Invoice.from(
      9,
      '0109',
      Customer.min(5, 'Febeca'),
      100.0,
      50.0,
      16,
      150.0,
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Invoice.from(
      10,
      '0110',
      Customer.min(5, 'Febeca'),
      100.0,
      50.0,
      16,
      150.0,
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Invoice.from(
      11,
      '0111',
      Customer.min(6, 'Beval'),
      100.0,
      50.0,
      16,
      150.0,
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Invoice.from(
      12,
      '0112',
      Customer.min(6, 'Beval'),
      100.0,
      50.0,
      16,
      150.0,
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
  ];

  @override
  Future<void> add(Invoice entity) async {
    _invoices.add(entity);
  }

  @override
  Future<void> update(Invoice entity) async {
    _invoices.removeWhere((invoice) => invoice.id == entity.id);
    _invoices.add(entity);
  }

  @override
  Future<void> delete(List<Invoice> entities) async {
    for (final entity in entities) {
      _invoices.removeWhere((invoice) => invoice.id == entity.id);
    }
  }

  @override
  Future<List<Invoice>> findAll() async => _invoices;

  @override
  Future<Optional<Invoice>> findById(int id) async {
    final invoice = _invoices.where((invoice) => invoice.id == id).first;
    return Optional.ofNullable(invoice);
  }

  @override
  Future<List<Invoice>> findByCode(String code) async {
    return _invoices.where((invoice) => invoice.code == code).toList();
  }

  @override
  Future<List<Invoice>> findByCustomerName(String name) async {
    return _invoices
        .where((invoice) => invoice.customer?.name == name)
        .toList();
  }

  @override
  Future<List<Invoice>> findByCustomerCode(String code) async {
    return _invoices
        .where((invoice) => invoice.customer?.code == code)
        .toList();
  }
}
