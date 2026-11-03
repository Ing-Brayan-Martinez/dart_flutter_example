import 'package:dart_flutter_example/data/memory/service/home_memory_service.dart';
import 'package:dart_flutter_example/data/webservice/service/home_http_service.dart';
import 'package:dart_flutter_example/domain/entity/home.dart';
import 'package:optional/optional.dart';

abstract class HomeRepository {
  Future<void> add(Home entity);

  Future<void> update(Home entity);

  Future<void> delete(List<Home> entities);

  Future<List<Home>> findAll();

  Future<Optional<Home>> findById(int id);
}

final class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._memoryService, this._httpService);

  final HomeMemoryService _memoryService;
  final HomeHttpService _httpService;

  @override
  Future<void> add(Home entity) async {
    await _memoryService.add(entity);
    await _httpService.add(entity);
  }

  @override
  Future<void> update(Home entity) async {
    await _memoryService.update(entity);
    await _httpService.update(entity);
  }

  @override
  Future<void> delete(List<Home> entitys) async {
    await _memoryService.delete(entitys);
    await _httpService.delete(entitys);
  }

  @override
  Future<List<Home>> findAll() => _memoryService.findAll();

  @override
  Future<Optional<Home>> findById(int id) => _memoryService.findById(id);
}
