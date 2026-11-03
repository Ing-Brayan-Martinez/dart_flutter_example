import 'dart:convert';

import 'package:dart_flutter_example/data/repository/home_repository.dart';
import 'package:dart_flutter_example/data/webservice/configuration/http.dart';
import 'package:dart_flutter_example/domain/entity/home.dart';
import 'package:dio/dio.dart';
import 'package:optional/optional.dart';

abstract interface class HomeHttpService implements HomeRepository {}

final class HomeHttpServiceImpl extends Http implements HomeHttpService {
  HomeHttpServiceImpl();

  @override
  Future<void> add(Home entity) async {
    await getHttpManager().post(
      '/homes',
      data: entity.toJson(),
      options: Options(contentType: 'application/json'),
    );
  }

  @override
  Future<void> update(Home entity) async {
    await getHttpManager().put(
      '/homes',
      data: entity.toJson(),
      options: Options(contentType: 'application/json'),
    );
  }

  @override
  Future<void> delete(List<Home> entities) async {
    await getHttpManager().put(
      '/homes/estatus',
      data: {'homes': entities.map((home) => home.toJson()).toList()},
      options: Options(contentType: 'application/json'),
    );
  }

  @override
  Future<List<Home>> findAll() async {
    final response = await getHttpManager().get('/homes');
    return _decodeList(
      response.data,
    ).map((item) => Home.fromJson(item as Map<String, Object>)).toList();
  }

  @override
  Future<Optional<Home>> findById(int id) async {
    final response = await getHttpManager().get('/homes/$id');
    final home = _decodeList(
      response.data,
    ).map((item) => Home.fromJson(item as Map<String, Object>)).single;
    return Optional.ofNullable(home);
  }

  List<dynamic> _decodeList(dynamic data) {
    final decoded = data is String ? jsonDecode(data) : data;
    return decoded as List<dynamic>;
  }
}
