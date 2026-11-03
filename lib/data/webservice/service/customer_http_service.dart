import 'dart:convert';

import 'package:dart_flutter_example/data/repository/customer_repository.dart';
import 'package:dart_flutter_example/data/webservice/configuration/http.dart';
import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:dio/dio.dart';
import 'package:optional/optional.dart';

abstract interface class CustomerHttpService implements CustomerRepository {}

final class CustomerHttpServiceImpl extends Http
    implements CustomerHttpService {
  CustomerHttpServiceImpl();

  @override
  Future<void> add(Customer entity) async {
    await getHttpManager().post(
      '/customers',
      data: entity.toJson(),
      options: Options(contentType: 'application/json'),
    );
  }

  @override
  Future<void> update(Customer entity) async {
    await getHttpManager().put(
      '/customers',
      data: entity.toJson(),
      options: Options(contentType: 'application/json'),
    );
  }

  @override
  Future<void> delete(List<Customer> entities) async {
    await getHttpManager().put(
      '/customers/estatus',
      data: {
        'customers': entities.map((customer) => customer.toJson()).toList(),
      },
      options: Options(contentType: 'application/json'),
    );
  }

  @override
  Future<List<Customer>> findAll() async {
    final response = await getHttpManager().get('/customers');
    return _decodeList(
      response.data,
    ).map((item) => Customer.fromJson(item as Map<String, Object>)).toList();
  }

  @override
  Future<Optional<Customer>> findById(int id) async {
    final response = await getHttpManager().get('/customers/$id');
    final customer = _decodeList(
      response.data,
    ).map((item) => Customer.fromJson(item as Map<String, Object>)).single;
    return Optional.ofNullable(customer);
  }

  @override
  Future<List<Customer>> findByName(String name) async {
    final response = await getHttpManager().get('/customers/name/$name');
    return _decodeList(
      response.data,
    ).map((item) => Customer.fromJson(item as Map<String, Object>)).toList();
  }

  @override
  Future<List<Customer>> findByCode(String code) async {
    final response = await getHttpManager().get('/customers/code/$code');
    return _decodeList(
      response.data,
    ).map((item) => Customer.fromJson(item as Map<String, Object>)).toList();
  }

  List<dynamic> _decodeList(dynamic data) {
    final decoded = data is String ? jsonDecode(data) : data;
    return decoded as List<dynamic>;
  }
}
