import 'dart:convert';

import 'package:dart_flutter_example/data/repository/invoice_repository.dart';
import 'package:dart_flutter_example/data/webservice/configuration/http.dart';
import 'package:dart_flutter_example/domain/entity/invoice.dart';
import 'package:dio/dio.dart';
import 'package:optional/optional.dart';

abstract interface class InvoiceHttpService implements InvoiceRepository {}

final class InvoiceHttpServiceImpl extends Http implements InvoiceHttpService {
  InvoiceHttpServiceImpl();

  @override
  Future<void> add(Invoice entity) async {
    await getHttpManager().post(
      '/invoices',
      data: entity.toJson(),
      options: Options(contentType: 'application/json'),
    );
  }

  @override
  Future<void> update(Invoice entity) async {
    await getHttpManager().put(
      '/invoices',
      data: entity.toJson(),
      options: Options(contentType: 'application/json'),
    );
  }

  @override
  Future<void> delete(List<Invoice> entities) async {
    await getHttpManager().put(
      '/invoices/estatus',
      data: {'invoices': entities.map((invoice) => invoice.toJson()).toList()},
      options: Options(contentType: 'application/json'),
    );
  }

  @override
  Future<List<Invoice>> findAll() async {
    final response = await getHttpManager().get('/invoices');
    return _decodeList(
      response.data,
    ).map((item) => Invoice.fromJson(item as Map<String, Object>)).toList();
  }

  @override
  Future<Optional<Invoice>> findById(int id) async {
    final response = await getHttpManager().get('/invoices/$id');
    final invoice = _decodeList(
      response.data,
    ).map((item) => Invoice.fromJson(item as Map<String, Object>)).single;
    return Optional.ofNullable(invoice);
  }

  @override
  Future<List<Invoice>> findByCode(String code) async {
    final response = await getHttpManager().get('/invoices/code/$code');
    return _decodeList(
      response.data,
    ).map((item) => Invoice.fromJson(item as Map<String, Object>)).toList();
  }

  @override
  Future<List<Invoice>> findByCustomerName(String name) async {
    final response = await getHttpManager().get(
      '/invoices/customers/name/$name',
    );
    return _decodeList(
      response.data,
    ).map((item) => Invoice.fromJson(item as Map<String, Object>)).toList();
  }

  @override
  Future<List<Invoice>> findByCustomerCode(String code) async {
    final response = await getHttpManager().get(
      '/invoices/customers/code/$code',
    );
    return _decodeList(
      response.data,
    ).map((item) => Invoice.fromJson(item as Map<String, Object>)).toList();
  }

  List<dynamic> _decodeList(dynamic data) {
    final decoded = data is String ? jsonDecode(data) : data;
    return decoded as List<dynamic>;
  }
}
