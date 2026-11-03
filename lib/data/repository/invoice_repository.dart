import 'package:dart_flutter_example/data/memory/service/invoice_memory_service.dart';
import 'package:dart_flutter_example/data/webservice/service/invoice_http_service.dart';
import 'package:dart_flutter_example/domain/entity/invoice.dart';
import 'package:optional/optional.dart';

abstract interface class InvoiceRepository {
  Future<void> add(Invoice entity);

  Future<void> update(Invoice entity);

  Future<void> delete(List<Invoice> entities);

  Future<List<Invoice>> findAll();

  Future<Optional<Invoice>> findById(int id);

  Future<List<Invoice>> findByCode(String code);

  Future<List<Invoice>> findByCustomerName(String name);

  Future<List<Invoice>> findByCustomerCode(String code);

  //Future<List<Invoice>> findByFilter(FilterInvoice filter);
}

final class InvoiceRepositoryImpl implements InvoiceRepository {
  InvoiceRepositoryImpl(this._memoryService, this._httpService);

  final InvoiceMemoryService _memoryService;
  final InvoiceHttpService _httpService;

  @override
  Future<void> add(Invoice entity) async {
    await _memoryService.add(entity);
    await _httpService.add(entity);
  }

  @override
  Future<void> update(Invoice entity) async {
    await _memoryService.update(entity);
    await _httpService.update(entity);
  }

  @override
  Future<void> delete(List<Invoice> entitys) async {
    await _memoryService.delete(entitys);
    await _httpService.delete(entitys);
  }

  @override
  Future<List<Invoice>> findAll() => _memoryService.findAll();

  @override
  Future<Optional<Invoice>> findById(int id) => _memoryService.findById(id);

  @override
  Future<List<Invoice>> findByCode(String code) =>
      _memoryService.findByCode(code);

  @override
  Future<List<Invoice>> findByCustomerCode(String code) =>
      _memoryService.findByCustomerCode(code);

  @override
  Future<List<Invoice>> findByCustomerName(String name) =>
      _memoryService.findByCustomerName(name);
}
