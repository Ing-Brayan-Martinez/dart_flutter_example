import 'package:dart_flutter_example/data/memory/service/customer_memory_service.dart';
import 'package:dart_flutter_example/data/memory/service/home_memory_service.dart';
import 'package:dart_flutter_example/data/memory/service/invoice_memory_service.dart';
import 'package:dart_flutter_example/data/repository/customer_repository.dart';
import 'package:dart_flutter_example/data/repository/home_repository.dart';
import 'package:dart_flutter_example/data/repository/invoice_repository.dart';
import 'package:dart_flutter_example/data/webservice/service/customer_http_service.dart';
import 'package:dart_flutter_example/data/webservice/service/home_http_service.dart';
import 'package:dart_flutter_example/data/webservice/service/invoice_http_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> appProviders = [
  Provider<CustomerMemoryService>(create: (_) => CustomerMemoryServiceImpl()),
  Provider<HomeMemoryService>(create: (_) => HomeMemoryServiceImpl()),
  Provider<InvoiceMemoryService>(create: (_) => InvoiceMemoryServiceImpl()),
  Provider<CustomerHttpService>(create: (_) => CustomerHttpServiceImpl()),
  Provider<HomeHttpService>(create: (_) => HomeHttpServiceImpl()),
  Provider<InvoiceHttpService>(create: (_) => InvoiceHttpServiceImpl()),
  Provider<CustomerRepository>(
    create: (context) => CustomerRepositoryImpl(
      context.read<CustomerMemoryService>(),
      context.read<CustomerHttpService>(),
    ),
  ),
  Provider<HomeRepository>(
    create: (context) => HomeRepositoryImpl(
      context.read<HomeMemoryService>(),
      context.read<HomeHttpService>(),
    ),
  ),
  Provider<InvoiceRepository>(
    create: (context) => InvoiceRepositoryImpl(
      context.read<InvoiceMemoryService>(),
      context.read<InvoiceHttpService>(),
    ),
  ),
];
