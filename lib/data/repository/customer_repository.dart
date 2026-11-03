import 'package:dart_flutter_example/data/memory/service/customer_memory_service.dart';
import 'package:dart_flutter_example/data/webservice/service/customer_http_service.dart';
import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:optional/optional.dart';

abstract interface class CustomerRepository {
  Future<void> add(Customer entity);

  Future<void> update(Customer entity);

  Future<void> delete(List<Customer> entities);

  Future<List<Customer>> findAll();

  Future<Optional<Customer>> findById(int id);

  Future<List<Customer>> findByName(String name);

  Future<List<Customer>> findByCode(String code);
}

final class CustomerRepositoryImpl implements CustomerRepository {
  CustomerRepositoryImpl(this._memoryService, this._httpService);

  final CustomerMemoryService _memoryService;
  final CustomerHttpService _httpService;

  @override
  Future<void> add(Customer entity) async {
    await _memoryService.add(entity);
    await _httpService.add(entity);
  }

  @override
  Future<void> update(Customer entity) async {
    await _memoryService.update(entity);
    await _httpService.update(entity);
  }

  @override
  Future<void> delete(List<Customer> entitys) async {
    await _memoryService.delete(entitys);
    await _httpService.delete(entitys);
  }

  @override
  Future<List<Customer>> findAll() => _memoryService.findAll();

  @override
  Future<Optional<Customer>> findById(int id) => _memoryService.findById(id);

  @override
  Future<List<Customer>> findByCode(String code) =>
      _memoryService.findByCode(code);

  @override
  Future<List<Customer>> findByName(String name) =>
      _memoryService.findByName(name);
}
