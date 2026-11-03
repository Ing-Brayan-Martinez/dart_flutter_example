import 'package:dart_flutter_example/domain/entity/home.dart';
import 'package:dart_flutter_example/data/repository/home_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  HomeBloc(this._repository);

  final HomeRepository _repository;
  final BehaviorSubject<List<Home>> _subject = BehaviorSubject<List<Home>>();

  void getHomes() async {
    final List<Home> res = await _repository.findAll();
    _subject.sink.add(res);
  }

  void dispose() {
    _subject.close();
  }

  Stream<List<Home>> get homeStream => _subject.stream;
}
