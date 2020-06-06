import 'package:college_backoffice/definitions/user.model.dart';
import 'package:college_backoffice/repository/user.repository.dart';

class UserService {
  UserRepository _userRepository;

  UserService() {
    this._userRepository = new UserRepository();
  }

  Future<User> findById(String id) {
    return this._userRepository.findById(id);
  }
}
