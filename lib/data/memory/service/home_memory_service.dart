import 'package:dart_flutter_example/data/memory/configuration/memory.dart';
import 'package:dart_flutter_example/data/repository/home_repository.dart';
import 'package:dart_flutter_example/domain/entity/home.dart';
import 'package:optional/optional.dart';

abstract interface class HomeMemoryService implements HomeRepository {}

final class HomeMemoryServiceImpl extends Memory implements HomeMemoryService {
  final List<Home> _homes = [
    Home.from(
      1,
      'bike',
      'Flutter.dev',
      'assets/image1.jpg',
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Home.from(
      2,
      'boat',
      'Flutter.dev',
      'assets/image2.jpg',
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Home.from(
      3,
      'bike',
      'Yahoo.com',
      'assets/image3.jpg',
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Home.from(
      4,
      'car',
      'Google.com',
      'assets/image4.jpg',
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Home.from(
      5,
      'run',
      'Github.com',
      'assets/image5.jpg',
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
    Home.from(
      6,
      'railway',
      'Github.com',
      'assets/image6.jpg',
      'Y',
      DateTime.now(),
      DateTime.now(),
    ),
  ];

  @override
  Future<void> add(Home entity) async {
    _homes.add(entity);
  }

  @override
  Future<void> update(Home entity) async {
    _homes.removeWhere((home) => home.id == entity.id);
    _homes.add(entity);
  }

  @override
  Future<void> delete(List<Home> entities) async {
    for (final entity in entities) {
      _homes.removeWhere((home) => home.id == entity.id);
    }
  }

  @override
  Future<List<Home>> findAll() async => _homes;

  @override
  Future<Optional<Home>> findById(int id) async {
    final home = _homes.where((home) => home.id == id).first;
    return Optional.ofNullable(home);
  }
}
