import 'package:dart_flutter_example/data/memory/service/customer_memory_service.dart';
import 'package:dart_flutter_example/data/repository/customer_repository.dart';
import 'package:dart_flutter_example/data/webservice/service/customer_http_service.dart';
import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:optional/optional.dart';

void main() {
  test(
    'keeps local mutation and propagates HTTP synchronization failures',
    () async {
      final memoryService = CustomerMemoryServiceImpl();
      final httpService = _FailingCustomerHttpService();
      final repository = CustomerRepositoryImpl(memoryService, httpService);
      final customer = Customer.from(
        99,
        '099',
        'Test customer',
        'Address',
        'test@example.com',
        '5551234',
        'Y',
        DateTime(2024),
        DateTime(2024),
      );

      await expectLater(repository.add(customer), throwsA(isA<StateError>()));

      expect(httpService.addCalls, 1);
      expect((await repository.findAll()).contains(customer), isTrue);
    },
  );
}

class _FailingCustomerHttpService implements CustomerHttpService {
  int addCalls = 0;

  @override
  Future<void> add(Customer entity) async {
    addCalls++;
    throw StateError('HTTP synchronization failed');
  }

  @override
  Future<void> update(Customer entity) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(List<Customer> entities) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Customer>> findAll() async {
    throw UnimplementedError();
  }

  @override
  Future<Optional<Customer>> findById(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Customer>> findByName(String name) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Customer>> findByCode(String code) async {
    throw UnimplementedError();
  }
}
