import 'package:college_backoffice/repository/classes.repository.dart';

class ClassService {
  ClassesRepository _classesRepository;

  ClassService() {
    _classesRepository = new ClassesRepository();
  }

  getAll() {
    return _classesRepository.findAll();
  }
}
