import 'package:n2020_the_good_bot/definitions/case.model.dart';
import 'package:n2020_the_good_bot/repository/case.repository.dart';

class CasesService {
  CasesRepository _casesRepository;

  CasesService() {
    this._casesRepository = new CasesRepository();
  }

  Future<List<Case>> getAll() {
    return this._casesRepository.findAll();
  }
}
