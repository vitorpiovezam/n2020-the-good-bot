import 'package:college_backoffice/repository/menu.repository.dart';

class MenuService {
  MenuRepository _menuRepository;

  MenuService() {
    this._menuRepository = new MenuRepository();
  }

  Future<List<MenuItem>> getMenuItems() {
    return this._menuRepository.findAll();
  }
}
